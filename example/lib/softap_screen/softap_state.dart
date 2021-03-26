import 'package:equatable/equatable.dart';

abstract class SoftApState extends Equatable {
  const SoftApState();

  @override
  List<Object> get props => [];
}

class SoftApStateLoaded extends SoftApState {}
