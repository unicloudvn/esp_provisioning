import 'dart:async';
// import 'dart:html';
import 'dart:io';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:esp_provisioning/esp_provisioning.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:location/location.dart' as location;
// import 'package:permission_handler/permission_handler.dart';

class BleService {
  static BleService _instance;
  // static BleManager _bleManager;
  static FlutterBluePlus _bleManager;
  static Logger log;
  bool _isPowerOn = false;
  StreamSubscription<BluetoothState> _stateSubscription;
  BluetoothDevice selectedPeripheral;
  List<String> serviceUUIDs;

  static BleService getInstance() {
    if (_instance == null) {
      _instance = BleService();
    }

    if (_bleManager == null) {
      _bleManager = FlutterBluePlus.instance;
      log = Logger(printer: PrettyPrinter());
    }
    log.v('BleService started');
    return _instance;
  }

  Future<BluetoothState> start() async {
    log.i('Ble sevice start');
    if (_isPowerOn) {
      var state = await _waitForBluetoothPoweredOn();
      log.i('Device power was on $state');
      return state;
    }
    var isPermissionOk = await requestBlePermissions();
    if (!isPermissionOk) {
      throw Future.error(Exception('Location permission not granted'));
    }

    log.v('createClient');

    // await _bleManager.createClient(
    //     restoreStateIdentifier: "example-ble-client-id",
    //     restoreStateAction: (peripherals) {
    //       peripherals?.forEach((peripheral) {
    //         log.v("Restored peripheral: ${peripheral.name}");
    //         selectedPeripheral = peripheral;
    //       });
    //     });

    if (Platform.isAndroid) {
      log.v('enableRadio');
      await _bleManager.turnOn();
    }

    try {
      BluetoothState state = await _waitForBluetoothPoweredOn();
      _isPowerOn = state == BluetoothState.on;
      if (!_isPowerOn) {
        if (Platform.isAndroid) {
          await _bleManager.turnOn();
          _isPowerOn = true;
        }
      }
      return state;
    } catch (e) {
      log.e('Error ${e.toString()}');
    }
    return BluetoothState.unknown;
  }

  void select(BluetoothDevice peripheral) async {
    bool _check = (await _bleManager.connectedDevices).contains(peripheral);
    if (_check == true) {
      await selectedPeripheral?.disconnect();
    }
    selectedPeripheral = peripheral;
    log.v('selectedPeripheral = $selectedPeripheral');
  }

  Future<bool> stop() async {
    if (!_isPowerOn) {
      return true;
    }
    _isPowerOn = false;
    stopScanBle();
    await _stateSubscription?.cancel();
    bool _check =
        (await _bleManager.connectedDevices).contains(selectedPeripheral);
    if (_check == true) {
      await selectedPeripheral?.disconnect();
    }

    if (Platform.isAndroid) {
      await _bleManager.turnOff();
    }
    // await _bleManager.destroyClient();
    return true;
  }

  Stream<List<ScanResult>> scanBle() {
    _bleManager.startScan(
        scanMode: ScanMode.balanced,
        allowDuplicates: true,
        withServices: [Guid(TransportBLE.PROV_BLE_SERVICE)]);
    return _bleManager.scanResults;
  }

  Future<void> stopScanBle() {
    return _bleManager.stopScan();
  }

  Future<EspProv> startProvisioning(
      {BluetoothDevice peripheral, String pop = 'abcd1234'}) async {
    if (!_isPowerOn) {
      await _waitForBluetoothPoweredOn();
    }
    BluetoothDevice p = peripheral ?? selectedPeripheral;
    log.v('peripheral here $p');
    await _bleManager.stopScan();
    log.v('STOPPPED PERIPHERAL SCAN ========');

    EspProv prov =
        EspProv(transport: TransportBLE(p), security: Security1(pop: pop));

    await prov.establishSession();
    log.i("PROV ${await prov.getStatus()}");

    return prov;
  }

  Future<BluetoothState> _waitForBluetoothPoweredOn() async {
    Completer completer = Completer<BluetoothState>();
    _stateSubscription?.cancel();
    _stateSubscription = _bleManager.state.listen((bluetoothState) async {
      log.v('bluetoothState = $bluetoothState');

      if ((bluetoothState == BluetoothState.on ||
              bluetoothState == BluetoothState.unauthorized) &&
          !completer.isCompleted) {
        completer.complete(bluetoothState);
      }
    });
    return completer.future.timeout(Duration(seconds: 5), onTimeout: () {});
    // => throw Exception('Wait for Bluetooth PowerOn timeout'));
  }

  Future<bool> requestBlePermissions() async {
    // location.Location _location = new location.Location();
    // bool _serviceEnabled;

    // _serviceEnabled = await _location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await _location.requestService();
    //   if (!_serviceEnabled) {
    //     return false;
    //   }
    // }
    var isLocationGranted = await Permission.locationWhenInUse.request();
    log.v('checkBlePermissions, isLocationGranted=$isLocationGranted');
    return isLocationGranted == PermissionStatus.granted;
  }
}
