import 'dart:async';
// import 'dart:html';
import 'dart:io';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:esp_provisioning/esp_provisioning.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart' as location;
// import 'package:permission_handler/permission_handler.dart';

class BleService {
  static BleService _instance;
  static BleManager _bleManager;
  static Logger log;
  bool _isPowerOn = false;
  StreamSubscription<BluetoothState> _stateSubscription;
  Peripheral selectedPeripheral;
  List<String> serviceUUIDs;

  static BleService getInstance() {
    if (_instance == null) {
      _instance = BleService();
    }

    if (_bleManager == null) {
      _bleManager = BleManager();
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
    await _bleManager.createClient(
        restoreStateIdentifier: "example-ble-client-id",
        restoreStateAction: (peripherals) {
          peripherals?.forEach((peripheral) {
            log.v("Restored peripheral: ${peripheral.name}");
            selectedPeripheral = peripheral;
          });
        });

    // if (Platform.isAndroid) {
    log.v('enableRadio');
      // await _bleManager.enableRadio();
    // }

    try {
      BluetoothState state = await _waitForBluetoothPoweredOn();
      _isPowerOn = state == BluetoothState.POWERED_ON;
      if(!_isPowerOn){
        if (Platform.isAndroid) {
          await _bleManager.enableRadio();
          _isPowerOn=true;
        }
      } 
      return state;
    } catch (e) {
      log.e('Error ${e.toString()}');
    }
    return BluetoothState.UNKNOWN;
  }

  void select(Peripheral peripheral) async {
    bool _check = await selectedPeripheral?.isConnected();
    if(_check == true){
      await selectedPeripheral?.disconnectOrCancelConnection();
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
    bool _check = await selectedPeripheral?.isConnected();
    if(_check == true){
      await selectedPeripheral?.disconnectOrCancelConnection();
    }

    if (Platform.isAndroid) {
      await _bleManager.disableRadio();
    }
    await _bleManager.destroyClient();
    return true;
  }

  Stream<ScanResult> scanBle() {
    stopScanBle();
    return _bleManager.startPeripheralScan(
        uuids: [TransportBLE.PROV_BLE_SERVICE],
        scanMode: ScanMode.balanced,
        allowDuplicates: true);
  }

  Future<void> stopScanBle() {
    return _bleManager.stopPeripheralScan();
  }

  Future<EspProv> startProvisioning({Peripheral peripheral, String pop = 'abcd1234'}) async {
    if (!_isPowerOn) {
      await _waitForBluetoothPoweredOn();
    }
    Peripheral p = peripheral ?? selectedPeripheral;
    log.v('peripheral $p');
    await _bleManager.stopPeripheralScan();
    EspProv prov = EspProv(
        transport: TransportBLE(p), security: Security1(pop: pop));
    await prov.establishSession();
    return prov;
  }

  Future<BluetoothState> _waitForBluetoothPoweredOn() async {
    Completer completer = Completer<BluetoothState>();
    _stateSubscription?.cancel();
    _stateSubscription = _bleManager
        .observeBluetoothState(emitCurrentValue: true)
        .listen((bluetoothState) async {
      log.v('bluetoothState = $bluetoothState');

      if ((bluetoothState == BluetoothState.POWERED_ON ||
              bluetoothState == BluetoothState.UNAUTHORIZED) &&
          !completer.isCompleted) {
        completer.complete(bluetoothState);
      }
    });
    return completer.future.timeout(Duration(seconds: 5),
        onTimeout: () {});
        // => throw Exception('Wait for Bluetooth PowerOn timeout'));
  }

  Future<bool> requestBlePermissions() async {
    location.Location _location = new location.Location();
    bool _serviceEnabled;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    var isLocationGranted = await Permission.locationWhenInUse.request();
    log.v('checkBlePermissions, isLocationGranted=$isLocationGranted');
    return isLocationGranted == PermissionStatus.granted;
  }
}
