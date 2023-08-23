import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:esp_provisioning/esp_provisioning.dart';
import 'package:logger/logger.dart';
import '../ble_service.dart';
import './wifi.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  var bleService = BleService.getInstance();
  EspProv prov;
  Logger log = Logger(printer: PrettyPrinter());

  WifiBloc() : super(WifiStateLoading()) {
    on<WifiEventLoad>((event, emit) async {
      await for (final result in _mapLoadToState()) {
        emit(result);
      }
    });
    on<WifiEventStartProvisioning>((event, emit) async {
      await for (final result in _mapProvisioningToState(event)) {
        emit(result);
      }
    });
  }

  // @override
  // Stream<WifiState> mapEventToState(
  //   WifiEvent event,
  // ) async* {
  //   if (event is WifiEventLoad) {
  //     yield* _mapLoadToState();
  //   } else if (event is WifiEventStartProvisioning) {
  //     yield* _mapProvisioningToState(event);
  //   }
  // }

  Stream<WifiState> _mapLoadToState() async* {
    log.v("MAP LOAD TO STATE");
    yield WifiStateConnecting();
    log.v("CONNECTING...");
    try {
      log.v("START PROVISIONING...");

      prov = await bleService.startProvisioning();
    } catch (e) {
      log.e('Error conencting to device $e');
      yield WifiStateError('Error conencting to device');
    }
    yield WifiStateScanning();

    try {
      // var listWifi = await prov.startScanWiFi();
      // List<Map<String, dynamic>> mapListWifi = [];
      // listWifi.forEach((element) {
      //   mapListWifi.add({
      //     'ssid': element.ssid,
      //     'rssi': element.rssi,
      //     'auth': element.private.toString() != 'Open'
      //   });
      // });

      // yield WifiStateLoaded(wifiList: mapListWifi);
      // log.v('Wifi $listWifi');
    } catch (e) {
      log.e('Error scan WiFi network $e');
      yield WifiStateError('Error scan WiFi network');
    }
  }

  Stream<WifiState> _mapProvisioningToState(
      WifiEventStartProvisioning event) async* {
    yield WifiStateProvisioning();
    await prov?.sendWifiConfig(ssid: "TP-LINK_20E4", password: "19701963");
    await prov?.applyWifiConfig();
    await Future.delayed(Duration(seconds: 1));
    yield WifiStateProvisioned();
  }

  @override
  Future<void> close() {
    prov?.dispose();
    return super.close();
  }
}
