import 'package:equatable/equatable.dart';

abstract class WifiEvent extends Equatable {
  const WifiEvent();

  @override
  List<Object> get props => [];
}

// events for BLE provisioning
class WifiEventLoadBLE extends WifiEvent {
  final Map<String, dynamic> selectedDevice;

  const WifiEventLoadBLE(this.selectedDevice);

  @override
  List<Object> get props => [selectedDevice];
}

class WifiEventConnectingBLE extends WifiEvent {}

class WifiEventScanningBLE extends WifiEvent {}

class WifiEventScannedBLE extends WifiEvent {}

class WifiEventLoadedBLE extends WifiEvent {
  final String wifiName;

  WifiEventLoadedBLE({this.wifiName});

  @override
  List<Object> get props => [wifiName];
}

class WifiEventStartProvisioningBLE extends WifiEvent {
  final String ssid;
  final String password;

  WifiEventStartProvisioningBLE({this.ssid, this.password});

  @override
  List<Object> get props => [ssid, password];
}

// events for softap provisioning
class WifiEventLoadSoftAP extends WifiEvent {}

class WifiEventConnectingSoftAP extends WifiEvent {}

class WifiEventScanningSoftAP extends WifiEvent {}

class WifiEventScannedSoftAP extends WifiEvent {}

class WifiEventLoadedSoftAP extends WifiEvent {
  final String wifiName;

  WifiEventLoadedSoftAP({this.wifiName});

  @override
  List<Object> get props => [wifiName];
}

class WifiEventStartProvisioningSoftAP extends WifiEvent {
  final String ssid;
  final String password;

  WifiEventStartProvisioningSoftAP({this.ssid, this.password});

  @override
  List<Object> get props => [ssid, password];
}