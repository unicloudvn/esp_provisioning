import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Crypt {
  static const MethodChannel _channel =
      const MethodChannel('esp_provisioning');

  Future<bool> init (Uint8List key, Uint8List iv) async {
    return await _channel.invokeMethod('init', {
      'key': key,
      'iv': iv,
    });
  }
  Future<Uint8List> crypt (Uint8List data) async {
    return _channel.invokeMethod('crypt', {
      'data': data,
    });
  }
}
