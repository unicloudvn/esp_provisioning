import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:esp_provisioning_example/ble_service.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'ble.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  var bleService = BleService.getInstance();
  StreamSubscription<List<ScanResult>> _scanSubscription;
  List<Map<String, dynamic>> bleDevices = [];

  BleBloc() : super(BleStateLoading()) {
    on<BleEventStart>((event, emit) async {
      await for (final result in _mapStartToState()) {
        emit(result);
      }
    });
    on<BleEventDeviceUpdated>((event, emit) {
      emit(BleStateLoaded(List.from(event.bleDevices)));
    });
    on<BleEventPermissionDenied>((event, emit) async {
      emit(BleStatePermissionDenied());
    });
    on<BleEventStopScan>((event, emit) async {
      await bleService.stopScanBle();
    });
    on<BleEventSelect>((event, emit) async {
      bleService.select(event.selectedDevice['peripheral']);
    });
  }

  // @override
  // Stream<BleState> mapEventToState(
  //   BleEvent event,
  // ) async* {
  //   if (event is BleEventStart) {
  //     yield* _mapStartToState();
  //   } else if (event is BleEventDeviceUpdated) {
  //     yield BleStateLoaded(List.from(event.bleDevices));
  //   } else if (event is BleEventSelect) {
  //     bleService.select(event.selectedDevice['peripheral']);
  //   } else if (event is BleEventStopScan) {
  //     await bleService.stopScanBle();
  //   }
  // }

  Stream<BleState> _mapStartToState() async* {
    var permissionIsGranted = await bleService.requestBlePermissions();
    if (!permissionIsGranted) {
      add(BleEventPermissionDenied());
      return;
    }
    var bleState = await bleService.start();
    if (bleState == BluetoothState.unauthorized) {
      add(BleEventPermissionDenied());
      return;
    }
    _scanSubscription?.cancel();
    _scanSubscription = bleService
        .scanBle()
        .debounce((_) => TimerStream(true, Duration(milliseconds: 100)))
        .listen((List<ScanResult> scanResult) {
      for (int i = 0; i < scanResult.length; i++) {
        var bleDevice = BleDevice(scanResult[i]);
        if (scanResult[i].advertisementData.localName != null) {
          var idx = bleDevices.indexWhere((e) => e['id'] == bleDevice.id);

          if (idx < 0) {
            bleDevices.add(bleDevice.toMap());
          } else {
            bleDevices[idx] = bleDevice.toMap();
          }
          add(BleEventDeviceUpdated(bleDevices));
        }
      }
    });
  }

  @override
  Future<void> close() {
    super.close();
    _scanSubscription?.cancel();
    return bleService.stopScanBle();
  }
}
