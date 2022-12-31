import 'dart:async';
import 'dart:typed_data';
import 'transport.dart';
import "package:flutter_blue/flutter_blue.dart";

class TransportBLE implements ProvTransport {
  final BluetoothDevice peripheral;
  final String serviceUUID;
  late Map<String, String> nuLookup;
  final Map<String, String> lockupTable;
  late BluetoothService bleService;
  late BluetoothCharacteristic bleCharacter;

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
    if (await isConnected()) {
      return Future.value(true);
    }
    await peripheral.connect(
        autoConnect: true, timeout: const Duration(seconds: 30));
    await peripheral.requestMtu(512);
    final services = await peripheral.discoverServices();
    if (services.isEmpty) {
      return false;
    }
    for (BluetoothService s in services) {
      if (s.uuid.toString() == PROV_BLE_SERVICE) {
        bleService = s;
        break;
      }
    }
    return await isConnected();
  }

  @override
  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    if (data.isNotEmpty) {
      for (var c in bleService.characteristics) {
        if (c.uuid.toString() == (epName)) {
          bleCharacter = c;
          await bleCharacter.write(List.from(data), withoutResponse: true);
          break;
        }
      }
      // await peripheral.writeCharacteristic(
      //     serviceUUID, nuLookup[epName ?? ""], data, true);
    }

    List<int> receivedData = await bleCharacter.read();
    return Uint8List.fromList(receivedData);
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
    return (await peripheral.state.last) == BluetoothDeviceState.connected;
  }
}
