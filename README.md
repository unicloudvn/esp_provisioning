# esp_provisioning

![Made with love in Vietnam](https://madewithlove.now.sh/vn?heart=true) ![Pub Version](https://img.shields.io/pub/v/esp_provisioning)

Espressif BLE Provisioning library for ESP32

![](https://github.com/sunshine-tech/esp_provisioning/blob/master/img.gif?raw=true)

A library for Flutter was developed to provide network credentials and/or custom data to an ESP32 over Bluetooth BLE.
The company makes chips ESP32, Espresif, they have 2 libraries for each Platform iOS and Android

- [esp-idf-provisioning-ios](https://github.com/espressif/esp-idf-provisioning-ios)
- [esp-idf-provisioning-android](https://github.com/espressif/esp-idf-provisioning-android)

However, the mobile application development on Flutter is easier now, and many will need this.

## Getting Started

- Need [flutter_ble_lib](https://github.com/Polidea/FlutterBleLib) for BLE transport in your application
- API (Check [exmaple](./exmaple))

```dart
 EspProv prov = EspProv(
        transport: TransportBLE(ble_peripheral), security: Security1(pop: pop));
 var success = await prov.establishSession();
 await prov.sendWifiConfig(ssid: event.ssid, password: event.password);
 await prov.applyWifiConfig();

```


## Protocol Communication Overview

Protocol Communication ([protocomm](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/provisioning/protocomm.html)) component manages secure sessions and provides framework for multiple transports. The application can also use protocomm layer directly to have application specific extensions for the provisioning (or non-provisioning) use cases.

Following features are available for provisioning :
- Communication security at application level

    - protocomm_security1 (curve25519 key exchange + AES-CTR encryption)

- Proof-of-possession (support with protocomm_security1 only)

Protocomm internally uses protobuf (protocol buffers) for secure session establishment. Though users can implement their own security (even without using protobuf). One can even use protocomm without any security layer.

Protocomm provides framework for various transports - WiFi (SoftAP+HTTPD), BLE, console - in which case the handler invocation is automatically taken care of on the device side (see Transport Examples below for code snippets).

Note that the client still needs to establish session (only for protocomm_security1) by performing the two way handshake. See Unified Provisioning for more details about the secure handshake logic.

### License

[Apache License Version 2.0](./LICENSE)