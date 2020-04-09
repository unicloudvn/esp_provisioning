import 'package:equatable/equatable.dart';

abstract class BleState extends Equatable {
  const BleState();

  @override
  List<Object> get props => [];
}

class BleStateLoading extends BleState {}

class BleStatePermissionDenied extends BleState {}

class BleStateLoaded extends BleState {
  final List<Map<String, dynamic>> bleDevices;

  const BleStateLoaded([this.bleDevices = const []]);

  @override
  List<Object> get props => [bleDevices];

  @override
  String toString() => 'BleStateLoaded { bleDevices: $bleDevices}';
}
