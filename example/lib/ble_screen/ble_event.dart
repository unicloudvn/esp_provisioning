import 'package:equatable/equatable.dart';

abstract class BleEvent extends Equatable {
  const BleEvent();

  @override
  List<Object> get props => [];
}

class BleEventStart extends BleEvent {}

class BleEventPermissionDenied extends BleEvent {}
class BleEventStopScan extends BleEvent {}

class BleEventDeviceUpdated extends BleEvent {
  final List<Map<String, dynamic>> bleDevices;

  const BleEventDeviceUpdated(this.bleDevices);

  @override
  List<Object> get props => [bleDevices];
}

class BleEventSelect extends BleEvent {
  final Map<String, dynamic> selectedDevice;

  const BleEventSelect(this.selectedDevice);

  @override
  List<Object> get props => [selectedDevice];
}
