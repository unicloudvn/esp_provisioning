import 'dart:async';
import 'package:flutter/foundation.dart';

import 'transport.dart';
import "package:flutter_blue_plus/flutter_blue_plus.dart";

class TransportBLE implements ProvTransport {
  final BluetoothDevice peripheral;
  final String serviceUUID;
  late Map<String, String> nuLookup;
  final Map<String, String> lockupTable;
  late BluetoothService bleService;
  late BluetoothCharacteristic? bleCharacter;

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
    nuLookup = <String, String>{};

    for (var name in lockupTable.keys) {
      var charsInt = int.parse(lockupTable[name] ?? '', radix: 16);
      var serviceHex = charsInt.toRadixString(16).padLeft(4, '0');
      nuLookup[name] =
          serviceUUID.substring(0, 4) + serviceHex + serviceUUID.substring(8);
    }
  }

  @override
  Future<bool> connect() async {
    try {
      if (await isConnected()) {
        return true;
      }
      await peripheral.connect(
          autoConnect: false, timeout: const Duration(seconds: 30));
      await peripheral.requestMtu(512);
      final services = (await peripheral.discoverServices()).where((element) {
        return element.uuid.toString() == serviceUUID;
      }).toList();

      if (services.isEmpty) {
        return false;
      }
      bleService = services[0];
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    if (!(await isConnected())) {
      return Uint8List.fromList([]);
    }
    if (data.isNotEmpty) {
      await Future.forEach(bleService.characteristics, (c) async {
        if (c.uuid.toString() == (nuLookup[epName])) {
          bleCharacter = c;
        }
      });
      if (bleCharacter != null) {
        try {
          await bleCharacter?.write(List.from(data));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
    if (bleCharacter != null) {
      try {
        List<int> receivedData = await bleCharacter!.read();
        return Uint8List.fromList(receivedData);
      } catch (e) {
        debugPrint(e.toString());
        return Uint8List.fromList([]);
      }
    }
    return Uint8List.fromList([]);
  }

  @override
  Future<void> disconnect() async {
    bool check = await isConnected();
    if (check) {
      return await peripheral.disconnect();
    } else {
      return;
    }
  }

  @override
  Future<bool> isConnected() async {
    return (await peripheral.state.first) == BluetoothDeviceState.connected;
  }
}
