import 'dart:typed_data';

import 'proto/dart/session.pb.dart';

enum SecurityState {
  REQUEST1,
  RESPONSE1_REQUEST2,
  RESPONSE2,
  FINISH,
}

abstract class ProvSecurity {
  Future<dynamic> encrypt(dynamic data);

  Future<dynamic> decrypt(dynamic data);

  Future<SessionData> securitySession(SessionData responseData);
}
