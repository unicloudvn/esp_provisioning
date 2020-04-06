///
//  Generated code. Do not modify.
//  source: wifi_constants.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class WifiStationState extends $pb.ProtobufEnum {
  static const WifiStationState Connected = WifiStationState._(0, 'Connected');
  static const WifiStationState Connecting = WifiStationState._(1, 'Connecting');
  static const WifiStationState Disconnected = WifiStationState._(2, 'Disconnected');
  static const WifiStationState ConnectionFailed = WifiStationState._(3, 'ConnectionFailed');

  static const $core.List<WifiStationState> values = <WifiStationState> [
    Connected,
    Connecting,
    Disconnected,
    ConnectionFailed,
  ];

  static final $core.Map<$core.int, WifiStationState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WifiStationState valueOf($core.int value) => _byValue[value];

  const WifiStationState._($core.int v, $core.String n) : super(v, n);
}

class WifiConnectFailedReason extends $pb.ProtobufEnum {
  static const WifiConnectFailedReason AuthError = WifiConnectFailedReason._(0, 'AuthError');
  static const WifiConnectFailedReason NetworkNotFound = WifiConnectFailedReason._(1, 'NetworkNotFound');

  static const $core.List<WifiConnectFailedReason> values = <WifiConnectFailedReason> [
    AuthError,
    NetworkNotFound,
  ];

  static final $core.Map<$core.int, WifiConnectFailedReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WifiConnectFailedReason valueOf($core.int value) => _byValue[value];

  const WifiConnectFailedReason._($core.int v, $core.String n) : super(v, n);
}

class WifiAuthMode extends $pb.ProtobufEnum {
  static const WifiAuthMode Open = WifiAuthMode._(0, 'Open');
  static const WifiAuthMode WEP = WifiAuthMode._(1, 'WEP');
  static const WifiAuthMode WPA_PSK = WifiAuthMode._(2, 'WPA_PSK');
  static const WifiAuthMode WPA2_PSK = WifiAuthMode._(3, 'WPA2_PSK');
  static const WifiAuthMode WPA_WPA2_PSK = WifiAuthMode._(4, 'WPA_WPA2_PSK');
  static const WifiAuthMode WPA2_ENTERPRISE = WifiAuthMode._(5, 'WPA2_ENTERPRISE');

  static const $core.List<WifiAuthMode> values = <WifiAuthMode> [
    Open,
    WEP,
    WPA_PSK,
    WPA2_PSK,
    WPA_WPA2_PSK,
    WPA2_ENTERPRISE,
  ];

  static final $core.Map<$core.int, WifiAuthMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WifiAuthMode valueOf($core.int value) => _byValue[value];

  const WifiAuthMode._($core.int v, $core.String n) : super(v, n);
}

