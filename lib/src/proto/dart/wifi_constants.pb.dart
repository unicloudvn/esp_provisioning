///
//  Generated code. Do not modify.
//  source: wifi_constants.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wifi_constants.pbenum.dart';

export 'wifi_constants.pbenum.dart';

class WifiConnectedState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WifiConnectedState', createEmptyInstance: create)
    ..aOS(1, 'ip4Addr')
    ..e<WifiAuthMode>(2, 'authMode', $pb.PbFieldType.OE, defaultOrMaker: WifiAuthMode.Open, valueOf: WifiAuthMode.valueOf, enumValues: WifiAuthMode.values)
    ..a<$core.List<$core.int>>(3, 'ssid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, 'bssid', $pb.PbFieldType.OY)
    ..a<$core.int>(5, 'channel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  WifiConnectedState._() : super();
  factory WifiConnectedState() => create();
  factory WifiConnectedState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WifiConnectedState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WifiConnectedState clone() => WifiConnectedState()..mergeFromMessage(this);
  WifiConnectedState copyWith(void Function(WifiConnectedState) updates) => super.copyWith((message) => updates(message as WifiConnectedState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WifiConnectedState create() => WifiConnectedState._();
  WifiConnectedState createEmptyInstance() => create();
  static $pb.PbList<WifiConnectedState> createRepeated() => $pb.PbList<WifiConnectedState>();
  @$core.pragma('dart2js:noInline')
  static WifiConnectedState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WifiConnectedState>(create);
  static WifiConnectedState _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ip4Addr => $_getSZ(0);
  @$pb.TagNumber(1)
  set ip4Addr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIp4Addr() => $_has(0);
  @$pb.TagNumber(1)
  void clearIp4Addr() => clearField(1);

  @$pb.TagNumber(2)
  WifiAuthMode get authMode => $_getN(1);
  @$pb.TagNumber(2)
  set authMode(WifiAuthMode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ssid => $_getN(2);
  @$pb.TagNumber(3)
  set ssid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSsid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSsid() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bssid => $_getN(3);
  @$pb.TagNumber(4)
  set bssid($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBssid() => $_has(3);
  @$pb.TagNumber(4)
  void clearBssid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get channel => $_getIZ(4);
  @$pb.TagNumber(5)
  set channel($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannel() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannel() => clearField(5);
}

