import 'dart:typed_data';

import 'proto/dart/session.pb.dart';

enum SecurityState {
  REQUEST1,
  RESPONSE1_REQUEST2,
  RESPONSE2,
  FINISH,
}

abstract class ProvSecurity {
  Future<Uint8List> encrypt(Uint8List data);

  Future<Uint8List> decrypt(Uint8List data);

  Future<SessionData> securitySession(SessionData responseData);
}
