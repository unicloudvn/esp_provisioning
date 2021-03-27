import 'package:equatable/equatable.dart';

abstract class SoftApEvent extends Equatable {
  const SoftApEvent();

  @override
  List<Object> get props => [];
}

class SoftApEventStart extends SoftApEvent {}