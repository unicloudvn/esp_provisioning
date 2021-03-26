import 'dart:async';
import 'dart:io';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:logger/logger.dart';
import 'package:esp_provisioning/esp_provisioning.dart';
import 'package:permission_handler/permission_handler.dart';
class WiFiService {
  Future<EspProv> startProvisioning(
      {Peripheral peripheral, String pop = 'abcd1234'}) async {
    EspProv prov = EspProv(
        transport: TransportHTTP("192.168.4.1", 80));
    var success = await prov.establishSession();
    if (!success) {
      throw Exception('Error establishSession');
    }
    return prov;
  }
}