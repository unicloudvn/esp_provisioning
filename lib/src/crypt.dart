import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/cbc.dart';

class Crypt {
  static final Crypt _singleton = Crypt._internal();
  factory Crypt() {
    return _singleton;
  }
  Crypt._internal();
  static const MethodChannel _channel = const MethodChannel('esp_provisioning');

  Future<bool> init(Uint8List key, Uint8List iv) async {
    return await _channel.invokeMethod('init', {
      'key': key,
      'iv': iv,
    });
  }

  Future<Uint8List> crypt(Uint8List data) async {
    return await _channel.invokeMethod('crypt', {
      'data': data,
    });
  }
}
