import 'package:equatable/equatable.dart';

abstract class WifiEvent extends Equatable {
  const WifiEvent();

  @override
  List<Object> get props => [];
}

class WifiEventLoad extends WifiEvent {
  final Map<String, dynamic> selectedDevice;

  const WifiEventLoad(this.selectedDevice);

  @override
  List<Object> get props => [selectedDevice];
}

class WifiEventConnecting extends WifiEvent {}

class WifiEventScanning extends WifiEvent {}

class WifiEventScanned extends WifiEvent {}

class WifiEventLoaded extends WifiEvent {
  final String wifiName;

  WifiEventLoaded({this.wifiName});

  @override
  List<Object> get props => [wifiName];
}

class WifiEventStartProvisioning extends WifiEvent {
  final String ssid;
  final String password;

  WifiEventStartProvisioning({this.ssid, this.password});

  @override
  List<Object> get props => [ssid, password];
}
