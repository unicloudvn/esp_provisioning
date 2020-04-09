import 'dart:convert';
import 'dart:typed_data';

import 'proto/dart/constants.pbenum.dart';
import 'proto/dart/wifi_config.pb.dart';
import 'proto/dart/wifi_scan.pb.dart';
import 'proto/dart/session.pb.dart';
import 'security.dart';

import 'transport.dart';

class EspProv {
  ProvTransport transport;
  ProvSecurity security;

  EspProv({this.transport, this.security});

  Future<bool> establishSession() async {
    try {
      SessionData responseData;
      await transport.connect();
      while (true) {
        var request = await security.securitySession(responseData);
        if (request == null) {
          return true;
        }

        var response = await transport.sendReceive(
            'prov-session', request.writeToBuffer());
        if (response.isEmpty) {
          return false;
        }
        responseData = SessionData.fromBuffer(response);
      }
    } catch (e) {
      print('EstablishSession error $e');
      return false;
    }
  }

  Future<void> dispose() async {
    return transport.disconnect();
  }

  Future<List<Map<String, dynamic>>> startScanWiFi() async {
    return await scan();
  }

  Future<WiFiScanPayload> startScanResponse(Uint8List data) async {
    var respPayload = WiFiScanPayload.fromBuffer(await security.decrypt(data));
    if (respPayload.msg != WiFiScanMsgType.TypeRespScanStart) {
      throw Exception('Invalid expected message type $respPayload');
    }
    return respPayload;
  }

  Future<WiFiScanPayload> startScanRequest(
      {bool blocking = true,
      bool passive = false,
      int groupChannels = 5,
      int periodMs = 0}) async {
    WiFiScanPayload payload = WiFiScanPayload();
    payload.msg = WiFiScanMsgType.TypeCmdScanStart;

    CmdScanStart scanStart = CmdScanStart();
    scanStart.blocking = blocking;
    scanStart.passive = passive;
    scanStart.groupChannels = groupChannels;
    scanStart.periodMs = periodMs;
    payload.cmdScanStart = scanStart;
    var reqData = await security.encrypt(payload.writeToBuffer());
    var respData = await transport.sendReceive('prov-scan', reqData);
    return startScanResponse(respData);
  }

  Future<WiFiScanPayload> scanStatusResponse(Uint8List data) async {
    var respPayload = WiFiScanPayload.fromBuffer(await security.decrypt(data));
    if (respPayload.msg != WiFiScanMsgType.TypeRespScanStatus) {
      throw Exception('Invalid expected message type $respPayload');
    }
    return respPayload;
  }

  Future<WiFiScanPayload> scanStatusRequest() async {
    WiFiScanPayload payload = WiFiScanPayload();
    payload.msg = WiFiScanMsgType.TypeCmdScanStatus;
    var reqData = await security.encrypt(payload.writeToBuffer());
    var respData = await transport.sendReceive('prov-scan', reqData);
    return scanStatusResponse(respData);
  }

  Future<List<Map<String, dynamic>>> scanResultRequest(
      {int startIndex = 0, int count = 0}) async {
    WiFiScanPayload payload = WiFiScanPayload();
    payload.msg = WiFiScanMsgType.TypeCmdScanResult;

    CmdScanResult cmdScanResult = new CmdScanResult();
    cmdScanResult.startIndex = startIndex;
    cmdScanResult.count = count;

    payload.cmdScanResult = cmdScanResult;
    var reqData = await security.encrypt(payload.writeToBuffer());
    var respData = await transport.sendReceive('prov-scan', reqData);
    return scanResultResponse(respData);
  }

  Future<List<Map<String, dynamic>>> scanResultResponse(Uint8List data) async {
    var respPayload = WiFiScanPayload.fromBuffer(await security.decrypt(data));
    if (respPayload.msg != WiFiScanMsgType.TypeRespScanResult) {
      throw Exception('Invalid expected message type $respPayload');
    }
    List<Map<String, dynamic>> ret = new List<Map<String, dynamic>>();
    for (var entry in respPayload.respScanResult.entries) {
      ret.add({
        'ssid': utf8.decode(entry.ssid),
        'channel': entry.channel,
        'rssi': entry.rssi,
        'bssid': entry.bssid,
        'auth': entry.auth.toString(),
      });
    }
    return ret;
  }

  Future<List<Map<String, dynamic>>> scan(
      {bool blocking = true,
      bool passive = false,
      int groupChannels = 5,
      int periodMs = 0}) async {
    try {
      await startScanRequest(
          blocking: blocking,
          passive: passive,
          groupChannels: groupChannels,
          periodMs: periodMs);
      var status = await scanStatusRequest();
      var resultCount = status.respScanStatus.resultCount;
      List<Map<String, dynamic>> ret = new List<Map<String, dynamic>>();
      if (resultCount > 0) {
        var index = 0;
        var remaining = resultCount;
        while (remaining > 0) {
          var count = remaining > 4 ? 4 : remaining;
          var data = await scanResultRequest(startIndex: index, count: count);
          ret.addAll(data);
          remaining -= count;
          index += count;
        }
      }
      return ret;
    } catch (e) {
      print('Error scan wifi $e');
    }
    return null;
  }

  Future<bool> sendWifiConfig({String ssid, String password}) async {
    var payload = WiFiConfigPayload();
    payload.msg = WiFiConfigMsgType.TypeCmdSetConfig;

    var cmdSetConfig = CmdSetConfig();
    cmdSetConfig.ssid = utf8.encode(ssid ?? '');
    cmdSetConfig.passphrase = utf8.encode(password ?? '');
    payload.cmdSetConfig = cmdSetConfig;
    var reqData = await security.encrypt(payload.writeToBuffer());
    var respData = await transport.sendReceive('prov-config', reqData);
    var respRaw = await security.decrypt(respData);
    var respPayload = WiFiConfigPayload.fromBuffer(respRaw);
    return (respPayload.respSetConfig.status == Status.Success);
  }

  Future<bool> applyWifiConfig() async {
    var payload = WiFiConfigPayload();
    payload.msg = WiFiConfigMsgType.TypeCmdApplyConfig;
    var reqData = await security.encrypt(payload.writeToBuffer());
    var respData = await transport.sendReceive('prov-config', reqData);
    var respRaw = await security.decrypt(respData);
    var respPayload = WiFiConfigPayload.fromBuffer(respRaw);
    return (respPayload.respApplyConfig.status == Status.Success);
  }
}
