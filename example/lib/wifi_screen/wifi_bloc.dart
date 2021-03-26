import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:esp_provisioning/esp_provisioning.dart';
import 'package:logger/logger.dart';
import '../ble_service.dart';
import './wifi.dart';

class WifiBlocBLE extends Bloc<WifiEvent, WifiState> {
  var bleService = BleService.getInstance();
  EspProv prov;
  Logger log = Logger(printer: PrettyPrinter());

  @override
  WifiState get initialState => WifiStateLoading();

  @override
  Stream<WifiState> mapEventToState(
    WifiEvent event,
  ) async* {
    if (event is WifiEventLoadBLE) {
      bleService.select(event.selectedDevice['peripheral']);
      yield* _mapLoadToState();
    } else if (event is WifiEventStartProvisioningBLE) {
      yield* _mapProvisioningToState(event);
    }
  }

  Stream<WifiState> _mapLoadToState() async* {
    yield WifiStateConnecting();
    try {
      prov = await bleService.startProvisioning();
    } catch (e) {
      log.e('Error conencting to device $e');
      yield WifiStateError('Error conencting to device');
    }
    yield WifiStateScanning();

    try {
      var listWifi = await prov.startScanWiFi();
      yield WifiStateLoaded(wifiList: listWifi ?? []);
      log.v('Wifi $listWifi');
    } catch (e) {
      log.e('Error scan WiFi network $e');
      yield WifiStateError('Error scan WiFi network');
    }
  }

  Stream<WifiState> _mapProvisioningToState(
      WifiEventStartProvisioningBLE event) async* {
    yield WifiStateProvisioning();
    await prov?.sendWifiConfig(ssid: event.ssid, password: event.password);
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
