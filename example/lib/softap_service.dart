import 'dart:async';
import 'dart:io';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:esp_provisioning/esp_provisioning.dart';

class SoftAPService {
  final String hostname;
  final int port;
  SoftAPService(this.hostname, this.port);

  Future<EspProv> startProvisioning() async {
    EspProv prov = EspProv(
        transport: TransportHTTP(this.hostname, this.port));
    var success = await prov.establishSession();
    if (!success) {
      throw Exception('Error establishSession');
    }
    return prov;
  }
}