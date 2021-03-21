import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:esp_provisioning_example/ble_service.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:rxdart/rxdart.dart';
import 'ble.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  var bleService = BleService.getInstance();
  StreamSubscription<ScanResult> _scanSubscription;
  List<Map<String, dynamic>> bleDevices = new List<Map<String, dynamic>>();

  BleBloc(BleState initialState) : super(initialState);

  @override
  Stream<BleState> mapEventToState(
    BleEvent event,
  ) async* {
    if (event is BleEventStart) {
      yield* _mapStartToState();
    } else if (event is BleEventDeviceUpdated) {
      yield BleStateLoaded(List.from(event.bleDevices));
    } else if (event is BleEventSelect) {
      bleService.select(event.selectedDevice['peripheral']);
    } else if (event is BleEventStopScan) {
      await bleService.stopScanBle();
    }
  }

  Stream<BleState> _mapStartToState() async* {
    var permissionIsGranted = await bleService.requestBlePermissions();
    if (!permissionIsGranted) {
      add(BleEventPermissionDenied());
      return;
    }
    var bleState = await bleService.start();
    if (bleState == BluetoothState.UNAUTHORIZED) {
      add(BleEventPermissionDenied());
      return;
    }
    _scanSubscription?.cancel();
    _scanSubscription = bleService
        .scanBle()
        .debounce((_) => TimerStream(true, Duration(milliseconds: 100)))
        .listen((ScanResult scanResult) {
      var bleDevice = BleDevice(scanResult);
      if (scanResult.advertisementData.localName != null) {
        var idx = bleDevices.indexWhere((e) => e['id'] == bleDevice.id);

        if (idx < 0) {
          bleDevices.add(bleDevice.toMap());
        } else {
          bleDevices[idx] = bleDevice.toMap();
        }
        add(BleEventDeviceUpdated(bleDevices));
      }
    });
  }

  @override
  Future<void> close() {
    _scanSubscription?.cancel();
    bleService.stopScanBle();
  }
}
