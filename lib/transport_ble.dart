import 'dart:async';
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:meta/meta.dart';
import 'transport.dart';

class TransportBLE implements ProvTransport {
  final Peripheral peripheral;
  final String serviceUUID;
  Map<String, String> nuLookup;
  final Map<String, String> lockupTable;

  static const PROV_BLE_SERVICE = '021a9004-0382-4aea-bff4-6b3f1c5adfb4';
  static const PROV_BLE_EP = {
    'prov-scan': 'ff50',
    'prov-session': 'ff51',
    'prov-config': 'ff52',
    'proto-ver': 'ff53',
    'custom-data': 'ff54',
  };

  TransportBLE(this.peripheral,
      {this.serviceUUID = PROV_BLE_SERVICE, this.lockupTable = PROV_BLE_EP}) {
    nuLookup = new Map<String, String>();

    for (var name in lockupTable.keys) {
      var charsInt = int.parse(lockupTable[name], radix: 16);
      var serviceHex = charsInt.toRadixString(16).padLeft(4, '0');
      nuLookup[name] =
          serviceUUID.substring(0, 4) + serviceHex + serviceUUID.substring(8);
    }
  }

  Future<bool> connect() async {
    var isConnected = await peripheral.isConnected();
    if (isConnected) {
      return true;
    }
    await peripheral.connect();
    await peripheral.discoverAllServicesAndCharacteristics(
        transactionId: 'discoverAllServicesAndCharacteristics');
    return peripheral.isConnected();
  }

  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    if (data != null && data.length > 0) {
      await peripheral.writeCharacteristic(
          serviceUUID, nuLookup[epName], data, false);
    }
    CharacteristicWithValue receivedData = await peripheral.readCharacteristic(
        serviceUUID, nuLookup[epName],
        transactionId: 'readCharacteristic');
    return receivedData.value;
  }

  Future<void> disconnect() async {
    return await peripheral.disconnectOrCancelConnection();
  }

  void dispose() {
    print('dispose ble');
  }
}
