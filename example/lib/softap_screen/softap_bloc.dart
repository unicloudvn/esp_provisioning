
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esp_provisioning_example/softap_screen/softap_event.dart';
import 'package:esp_provisioning_example/softap_screen/softap_state.dart';
import 'package:esp_provisioning_example/softap_service.dart';



class SoftApBloc extends Bloc<SoftApEvent,SoftApState> {
  var softApService = SoftAPService("192.168.4.1", 80);

  @override
  // TODO: implement initialState
  get initialState => SoftApStateLoaded();

  @override
  Stream<SoftApState> mapEventToState(SoftApEvent) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}