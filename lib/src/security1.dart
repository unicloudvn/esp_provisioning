import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:cryptography/cryptography.dart';

import 'proto/dart/sec1.pb.dart';
import 'proto/dart/session.pb.dart';
import 'security.dart';
import 'crypt.dart';

class Security1 implements ProvSecurity {
  final String pop;
  final bool verbose;
  SecurityState sessionState;
  SimpleKeyPair clientKey;
  SimplePublicKey devicePublicKey;
  Uint8List deviceRandom;
  Crypt crypt = Crypt();
  X25519 x25519 = X25519();
  Sha256 sha256 = Sha256();

  Security1(
      {this.pop,
      this.sessionState = SecurityState.REQUEST1,
      this.verbose = false});

  void _verbose(dynamic data) {
    if (verbose) {
      print('+++ $data +++');
    }
  }

  Future<Uint8List> encrypt(Uint8List data) async {
    _verbose('raw before process ${data.toString()}');
    return crypt.crypt(data);
  }

  Future<Uint8List> decrypt(Uint8List data) async {
    return encrypt(data);
  }

  Future<void> _generateKey() async {
    clientKey = await x25519.newKeyPair();
  }

  Uint8List _xor(Uint8List a, Uint8List b) {
    Uint8List ret = new Uint8List(max(a.length, b.length));
    for (var i = 0; i < max(a.length, b.length); i++) {
      final _a = i < a.length ? a[i] : 0;
      final _b = i < b.length ? b[i] : 0;
      ret[i] = (_a ^ _b);
    }
    return ret;
  }

  Future<SessionData> securitySession(SessionData responseData) async {
    if (sessionState == SecurityState.REQUEST1) {
      sessionState = SecurityState.RESPONSE1_REQUEST2;
      return await setup0Request();
    }
    if (sessionState == SecurityState.RESPONSE1_REQUEST2) {
      sessionState = SecurityState.RESPONSE2;
      await setup0Response(responseData);
      return await setup1Request(responseData);
    }
    if (sessionState == SecurityState.RESPONSE2) {
      sessionState = SecurityState.FINISH;
      await setup1Response(responseData);
      return null;
    }
    throw Exception('Unexpected state');
  }

  Future<SessionData> setup0Request() async {
    _verbose('setup0Request');
    var setupRequest = new SessionData();

    setupRequest.secVer = SecSchemeVersion.SecScheme1;
    await _generateKey();
    SessionCmd0 sc0 = SessionCmd0();
    List<int> temp = await clientKey.extractPublicKey().then((value) => value.bytes);
    sc0.clientPubkey = temp;
    // await clientKey.extractPublicKey().byte;
    Sec1Payload sec1 = Sec1Payload();
    sec1.sc0 = sc0;
    setupRequest.sec1 = sec1;
    _verbose(
        'setup0Request: clientPubkey = ${temp.toString()}');
    return setupRequest;
  }

  Future<SessionData> setup0Response(SessionData responseData) async {
    SessionData setupResp = responseData;
    if (setupResp.secVer != SecSchemeVersion.SecScheme1) {
      throw Exception('Invalid sec scheme');
    }
    devicePublicKey = SimplePublicKey(setupResp.sec1.sr0.devicePubkey,type: x25519.keyPairType);
    deviceRandom = setupResp.sec1.sr0.deviceRandom;

    _verbose(
        'setup0Response:Device public key ${devicePublicKey.bytes.toString()}');
    _verbose('setup0Response:Device random ${deviceRandom.toString()}');

    final sharedKey = await x25519.sharedSecretKey(
        keyPair: clientKey,
        remotePublicKey: devicePublicKey);
    var sharedK = await sharedKey.extractBytes();
    _verbose('setup0Response: Shared key calculated: ${sharedK.toString()}');
    if (pop != null) {
      var sink = sha256.newHashSink();
      sink.add(utf8.encode(pop));
      sink.close();
      final hash = await sink.hash();
      sharedK = _xor(Uint8List.fromList(sharedK), Uint8List.fromList(hash.bytes));
      _verbose(
          'setup0Response: pop: $pop, hash: ${hash.bytes.toString()} sharedK: ${sharedK.toString()}');
    }
    await crypt.init(sharedK, deviceRandom);
    _verbose(
        'setup0Response: cipherSecretKey: ${sharedK.toString()} cipherNonce: ${deviceRandom.toString()}');
    return setupResp;
  }

  Future<SessionData> setup1Request(SessionData responseData) async {
    _verbose('setup1Request ${devicePublicKey.bytes.toString()}');
    var clientVerify = await encrypt(devicePublicKey.bytes);

    _verbose('client verify ${clientVerify.toString()}');
    var setupRequest = SessionData();
    setupRequest.secVer = SecSchemeVersion.SecScheme1;
    Sec1Payload sec1 = Sec1Payload();
    sec1.msg = Sec1MsgType.Session_Command1;
    SessionCmd1 sc1 = SessionCmd1();
    sc1.clientVerifyData = clientVerify;
    sec1.sc1 = sc1;
    setupRequest.sec1 = sec1;
    return setupRequest;
  }

  Future<SessionData> setup1Response(SessionData responseData) async {
    _verbose('setup1Response');
    var setupResp = responseData;
    if (setupResp.secVer == SecSchemeVersion.SecScheme1) {
      final deviceVerify = setupResp.sec1.sr1.deviceVerifyData;
      _verbose('Device verify: ${deviceVerify.toString()}');
      final encClientPubkey =
          await decrypt(setupResp.sec1.sr1.deviceVerifyData);
      _verbose('Enc client pubkey: ${encClientPubkey.toString()}');
      Function eq = const ListEquality().equals;
      List<int> temp = await clientKey.extractPublicKey().then((value) => value.bytes);
      if (!eq(encClientPubkey, temp)) {
        throw Exception('Mismatch in device verify');
      }
      return null;
    }
    throw Exception('Unsupported security protocol');
  }
}