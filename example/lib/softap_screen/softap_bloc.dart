
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esp_provisioning_example/softap_screen/softap_event.dart';
import 'package:esp_provisioning_example/softap_screen/softap_state.dart';
import 'package:esp_provisioning_example/softap_service.dart';



class SoftApBloc extends Bloc<SoftApEvent,SoftApState> {

  @override
  // TODO: implement initialState
  get initialState => SoftApStateLoaded();

  @override
  Stream<SoftApState> mapEventToState(event) async* {
    if (event is SoftApEventStart){
        yield* _mapStartToState();
      }
    }
    Stream<SoftApState> _mapStartToState() async* {

    }
}

