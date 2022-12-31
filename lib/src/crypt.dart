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
  late final BlockCipher _encrypt;
  late final BlockCipher _decrypt;

  void init(
    Uint8List key,
    Uint8List iv,
  ) {
    _encrypt = BlockCipher('AES/CTR/NoPadding')
      ..init(true, ParametersWithIV(KeyParameter(key), iv)); // true=encrypt

    _decrypt = BlockCipher('AES/CTR/NoPadding')
      ..init(true, ParametersWithIV(KeyParameter(key), iv)); //
  }

  Uint8List encrypt(Uint8List data) {
    // assert([128, 192, 256].contains(key.length * 8));
    // assert(128 == iv.length * 8);
    // assert(128 == paddedPlaintext.length * 8);

    // Create a CBC block cipher with AES, and initialize with key and IV

    // Encrypt the plaintext block-by-block

    // final cipherText = Uint8List(paddedPlaintext.length); // allocate space

    // var offset = 0;
    // while (offset < paddedPlaintext.length) {
    //   offset += _encrypt.processBlock(paddedPlaintext, offset, cipherText, offset);
    // }
    // assert(offset == paddedPlaintext.length);

    return _encrypt.process(data);
  }

  Uint8List decrypt(Uint8List data) {
    // assert([128, 192, 256].contains(key.length * 8));
    // assert(128 == iv.length * 8);
    // assert(128 == cipherText.length * 8);

    // Create a CBC block cipher with AES, and initialize with key and IV

    // final cbc = CBCBlockCipher(AESEngine())
    //   ..init(false, ParametersWithIV(KeyParameter(key), iv)); // false=decrypt

    // // Decrypt the cipherText block-by-block

    // final paddedPlainText = Uint8List(cipherText.length); // allocate space

    // var offset = 0;
    // while (offset < cipherText.length) {
    //   offset += cbc.processBlock(cipherText, offset, paddedPlainText, offset);
    // }
    // assert(offset == cipherText.length);

    return _decrypt.process(data);
  }
  // static const MethodChannel _channel =
  //     const MethodChannel('esp_provisioning');

  // Future<bool> init (Uint8List key, Uint8List iv) async {
  //   return await _channel.invokeMethod('init', {
  //     'key': key,
  //     'iv': iv,
  //   });
  // }
  // Future<Uint8List> crypt (Uint8List data) async {
  //   return _channel.invokeMethod('crypt', {
  //     'data': data,
  //   });
  // }
}
