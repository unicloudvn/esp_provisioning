import 'package:equatable/equatable.dart';

abstract class WifiState extends Equatable {
  const WifiState();

  @override
  List<Object> get props => [];
}

class WifiStateLoading extends WifiState {}

class WifiStateConnecting extends WifiState {}

class WifiStateError extends WifiState {
  final String errorMsg;

  WifiStateError(this.errorMsg);
}

class WifiStateScanning extends WifiState {}


class WifiStateLoaded extends WifiState {
  final List<Map<String, dynamic>> wifiList;

  WifiStateLoaded({this.wifiList});
}

class WifiStateProvisioning extends WifiState {}
class WifiStateProvisioned extends WifiState {}
