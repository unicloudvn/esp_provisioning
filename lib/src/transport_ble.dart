import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'transport.dart';

class TransportBLE implements ProvTransport {
  final BluetoothDevice peripheral;
  // final BluetoothDevice bluetoothDevice;
  // List<BluetoothService> services;
  final FlutterBluePlus bleManager = FlutterBluePlus.instance;
  final String serviceUUID;
  Map<String, String> nuLookup = {};
  final Map<String, String> lockupTable;

  static const PROV_BLE_SERVICE = '021a9004-0382-4aea-bff4-6b3f1c5adfb4';
  static const PROV_BLE_EP = {
    'prov-scan': 'ff50',
    'prov-session': '0001',
    'prov-config': '0002',
    'proto-ver': '0003',
    'custom-data': 'ff54',
  };

  //  {"prov-session", 0x0001},
  //     {"prov-config",  0x0002},
  //     {"proto-ver",    0x0003},

  TransportBLE(
    this.peripheral, {
    this.serviceUUID = PROV_BLE_SERVICE,
    this.lockupTable = PROV_BLE_EP,
  }) {
    nuLookup = new Map<String, String>();

    for (var name in lockupTable.keys) {
      var charsInt = lockupTable[name] == null
          ? null
          : int.parse(lockupTable[name], radix: 16);
      var serviceHex = charsInt?.toRadixString(16).padLeft(4, '0');
      if (charsInt != null && serviceHex != null) {
        nuLookup[name] =
            serviceUUID.substring(0, 4) + serviceHex + serviceUUID.substring(8);
      }
    }
  }

  Future<bool> connect() async {
    // bluetoothDevice.state.listen((state) async {
    //   if (state == BluetoothDeviceState.connected) {
    //     Future.value(true);
    //   } else {
    //     await bluetoothDevice.connect(autoConnect: false);
    //     await bluetoothDevice.requestMtu(512);
    //     services = await bluetoothDevice.discoverServices();
    //   }
    // });

    bool isConnected = (await bleManager.connectedDevices).contains(peripheral);
    if (isConnected) {
      return Future.value(true);
    }
    await peripheral.connect();
    // await peripheral.requestMtu(512);

    await peripheral.discoverServices();
    // discoverAllServicesAndCharacteristics(
    //     transactionId: 'discoverAllServicesAndCharacteristics');
    return (await bleManager.connectedDevices).contains(peripheral);
  }

  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    List<BluetoothService> services = await peripheral.discoverServices();

    log("EP NAME $epName DATA $data");
    if (data != null) {
      if (data.length > 0) {
        for (int i = 0; i < services.length; i++) {
          if (services[i].uuid.toString() == serviceUUID) {
            var characteristics = services[i].characteristics;
            for (BluetoothCharacteristic c in characteristics) {
              if (c.uuid.toString() == nuLookup[epName ?? ""]) {
                log("WAIT FOR 2 SECONDS");
                await Future.delayed(const Duration(seconds: 1));
                log("WRITING DATA $i ${c.deviceId.toString()} ${c.uuid.toString()} ${c.serviceUuid.toString()} $data");

                dynamic resp = await c.write(data, withoutResponse: false);
                log("WRITING DATA RESPONSE $resp");
              }
            }
          }
        }
      }
    }

    log("WRITE DATA COMPLETE, NOW READING");
    Uint8List readResponse;
    for (int i = 0; i < services.length; i++) {
      if (services[i].uuid.toString() == serviceUUID) {
        var characteristics = services[i].characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          if (c.uuid.toString() == nuLookup[epName ?? ""] &&
              c.properties.read) {
            log("WAIT FOR 2 SECONDS");
            await Future.delayed(const Duration(seconds: 1));
            log("READ CHARACTERISTIC ${c.uuid.toString()} ${nuLookup[epName ?? ""]}");
            List<int> value = await c.read();
            log("VALUE $value");
            readResponse = value;
          }
        }
      }
    }
    log("READ DATA COMPLETE, RESPONSE $readResponse");
    return readResponse;
  }

  Future<void> disconnect() async {
    // bluetoothDevice.state.listen((state) async {
    //   if (state == BluetoothDeviceState.connected) {
    //     return await bluetoothDevice.disconnect();
    //   } else {
    //     return;
    //   }
    // });

    bool check = (await bleManager.connectedDevices).contains(peripheral);
    if (check) {
      return await peripheral.disconnect();
    } else {
      return;
    }
  }

  Future<bool> checkConnect() async {
    log("INSIDE CHECK CONNECT FUNCTION");
    return (await bleManager.connectedDevices).contains(peripheral);
    // bluetoothDevice.state.listen((state) async {
    //   if (state == BluetoothDeviceState.connected) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // });
  }

  void dispose() {
    print('dispose ble');
  }
}
