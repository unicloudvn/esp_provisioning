import 'package:esp_provisioning_example/softap_screen/softap_bloc.dart';
import 'package:esp_provisioning_example/softap_screen/softap_event.dart';
import 'package:esp_provisioning_example/softap_screen/softap_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SoftApScreen extends StatefulWidget {
  @override
  _SoftApScreenState createState() => _SoftApScreenState();
}

class _SoftApScreenState extends State<SoftApScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Scanning BLE devices'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => SoftApBloc(),
        child: BlocBuilder<SoftApBloc, SoftApState>(
          builder: (BuildContext context, SoftApState state) {
            if (state is SoftApStateLoaded) {
              return Center(
                child: Text('Please connect WiFi to Subol_Gas_Sensor_*** device in "Wi-Fi Settings"'),
              );
            }
            return Center(
              child: SpinKitRipple(color: Theme.of(context).textSelectionColor),
            );
          },
        ),
      ),
    );
  }
}
