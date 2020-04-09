///
//  Generated code. Do not modify.
//  source: wifi_config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wifi_constants.pb.dart' as $3;

import 'constants.pbenum.dart' as $0;
import 'wifi_constants.pbenum.dart' as $3;
import 'wifi_config.pbenum.dart';

export 'wifi_config.pbenum.dart';

class CmdGetStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CmdGetStatus', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdGetStatus._() : super();
  factory CmdGetStatus() => create();
  factory CmdGetStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdGetStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CmdGetStatus clone() => CmdGetStatus()..mergeFromMessage(this);
  CmdGetStatus copyWith(void Function(CmdGetStatus) updates) => super.copyWith((message) => updates(message as CmdGetStatus));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdGetStatus create() => CmdGetStatus._();
  CmdGetStatus createEmptyInstance() => create();
  static $pb.PbList<CmdGetStatus> createRepeated() => $pb.PbList<CmdGetStatus>();
  @$core.pragma('dart2js:noInline')
  static CmdGetStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdGetStatus>(create);
  static CmdGetStatus _defaultInstance;
}

enum RespGetStatus_State {
  failReason, 
  connected, 
  notSet
}

class RespGetStatus extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, RespGetStatus_State> _RespGetStatus_StateByTag = {
    10 : RespGetStatus_State.failReason,
    11 : RespGetStatus_State.connected,
    0 : RespGetStatus_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RespGetStatus', createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..e<$0.Status>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..e<$3.WifiStationState>(2, 'staState', $pb.PbFieldType.OE, defaultOrMaker: $3.WifiStationState.Connected, valueOf: $3.WifiStationState.valueOf, enumValues: $3.WifiStationState.values)
    ..e<$3.WifiConnectFailedReason>(10, 'failReason', $pb.PbFieldType.OE, defaultOrMaker: $3.WifiConnectFailedReason.AuthError, valueOf: $3.WifiConnectFailedReason.valueOf, enumValues: $3.WifiConnectFailedReason.values)
    ..aOM<$3.WifiConnectedState>(11, 'connected', subBuilder: $3.WifiConnectedState.create)
    ..hasRequiredFields = false
  ;

  RespGetStatus._() : super();
  factory RespGetStatus() => create();
  factory RespGetStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespGetStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RespGetStatus clone() => RespGetStatus()..mergeFromMessage(this);
  RespGetStatus copyWith(void Function(RespGetStatus) updates) => super.copyWith((message) => updates(message as RespGetStatus));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetStatus create() => RespGetStatus._();
  RespGetStatus createEmptyInstance() => create();
  static $pb.PbList<RespGetStatus> createRepeated() => $pb.PbList<RespGetStatus>();
  @$core.pragma('dart2js:noInline')
  static RespGetStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespGetStatus>(create);
  static RespGetStatus _defaultInstance;

  RespGetStatus_State whichState() => _RespGetStatus_StateByTag[$_whichOneof(0)];
  void clearState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $3.WifiStationState get staState => $_getN(1);
  @$pb.TagNumber(2)
  set staState($3.WifiStationState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStaState() => $_has(1);
  @$pb.TagNumber(2)
  void clearStaState() => clearField(2);

  @$pb.TagNumber(10)
  $3.WifiConnectFailedReason get failReason => $_getN(2);
  @$pb.TagNumber(10)
  set failReason($3.WifiConnectFailedReason v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFailReason() => $_has(2);
  @$pb.TagNumber(10)
  void clearFailReason() => clearField(10);

  @$pb.TagNumber(11)
  $3.WifiConnectedState get connected => $_getN(3);
  @$pb.TagNumber(11)
  set connected($3.WifiConnectedState v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnected() => $_has(3);
  @$pb.TagNumber(11)
  void clearConnected() => clearField(11);
  @$pb.TagNumber(11)
  $3.WifiConnectedState ensureConnected() => $_ensure(3);
}

class CmdSetConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CmdSetConfig', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ssid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'passphrase', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'bssid', $pb.PbFieldType.OY)
    ..a<$core.int>(4, 'channel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CmdSetConfig._() : super();
  factory CmdSetConfig() => create();
  factory CmdSetConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdSetConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CmdSetConfig clone() => CmdSetConfig()..mergeFromMessage(this);
  CmdSetConfig copyWith(void Function(CmdSetConfig) updates) => super.copyWith((message) => updates(message as CmdSetConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdSetConfig create() => CmdSetConfig._();
  CmdSetConfig createEmptyInstance() => create();
  static $pb.PbList<CmdSetConfig> createRepeated() => $pb.PbList<CmdSetConfig>();
  @$core.pragma('dart2js:noInline')
  static CmdSetConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdSetConfig>(create);
  static CmdSetConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ssid => $_getN(0);
  @$pb.TagNumber(1)
  set ssid($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get passphrase => $_getN(1);
  @$pb.TagNumber(2)
  set passphrase($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassphrase() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassphrase() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get bssid => $_getN(2);
  @$pb.TagNumber(3)
  set bssid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBssid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBssid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get channel => $_getIZ(3);
  @$pb.TagNumber(4)
  set channel($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => clearField(4);
}

class RespSetConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RespSetConfig', createEmptyInstance: create)
    ..e<$0.Status>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..hasRequiredFields = false
  ;

  RespSetConfig._() : super();
  factory RespSetConfig() => create();
  factory RespSetConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSetConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RespSetConfig clone() => RespSetConfig()..mergeFromMessage(this);
  RespSetConfig copyWith(void Function(RespSetConfig) updates) => super.copyWith((message) => updates(message as RespSetConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespSetConfig create() => RespSetConfig._();
  RespSetConfig createEmptyInstance() => create();
  static $pb.PbList<RespSetConfig> createRepeated() => $pb.PbList<RespSetConfig>();
  @$core.pragma('dart2js:noInline')
  static RespSetConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSetConfig>(create);
  static RespSetConfig _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class CmdApplyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CmdApplyConfig', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdApplyConfig._() : super();
  factory CmdApplyConfig() => create();
  factory CmdApplyConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdApplyConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CmdApplyConfig clone() => CmdApplyConfig()..mergeFromMessage(this);
  CmdApplyConfig copyWith(void Function(CmdApplyConfig) updates) => super.copyWith((message) => updates(message as CmdApplyConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdApplyConfig create() => CmdApplyConfig._();
  CmdApplyConfig createEmptyInstance() => create();
  static $pb.PbList<CmdApplyConfig> createRepeated() => $pb.PbList<CmdApplyConfig>();
  @$core.pragma('dart2js:noInline')
  static CmdApplyConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdApplyConfig>(create);
  static CmdApplyConfig _defaultInstance;
}

class RespApplyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RespApplyConfig', createEmptyInstance: create)
    ..e<$0.Status>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..hasRequiredFields = false
  ;

  RespApplyConfig._() : super();
  factory RespApplyConfig() => create();
  factory RespApplyConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespApplyConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RespApplyConfig clone() => RespApplyConfig()..mergeFromMessage(this);
  RespApplyConfig copyWith(void Function(RespApplyConfig) updates) => super.copyWith((message) => updates(message as RespApplyConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespApplyConfig create() => RespApplyConfig._();
  RespApplyConfig createEmptyInstance() => create();
  static $pb.PbList<RespApplyConfig> createRepeated() => $pb.PbList<RespApplyConfig>();
  @$core.pragma('dart2js:noInline')
  static RespApplyConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespApplyConfig>(create);
  static RespApplyConfig _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

enum WiFiConfigPayload_Payload {
  cmdGetStatus, 
  respGetStatus, 
  cmdSetConfig, 
  respSetConfig, 
  cmdApplyConfig, 
  respApplyConfig, 
  notSet
}

class WiFiConfigPayload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, WiFiConfigPayload_Payload> _WiFiConfigPayload_PayloadByTag = {
    10 : WiFiConfigPayload_Payload.cmdGetStatus,
    11 : WiFiConfigPayload_Payload.respGetStatus,
    12 : WiFiConfigPayload_Payload.cmdSetConfig,
    13 : WiFiConfigPayload_Payload.respSetConfig,
    14 : WiFiConfigPayload_Payload.cmdApplyConfig,
    15 : WiFiConfigPayload_Payload.respApplyConfig,
    0 : WiFiConfigPayload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WiFiConfigPayload', createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15])
    ..e<WiFiConfigMsgType>(1, 'msg', $pb.PbFieldType.OE, defaultOrMaker: WiFiConfigMsgType.TypeCmdGetStatus, valueOf: WiFiConfigMsgType.valueOf, enumValues: WiFiConfigMsgType.values)
    ..aOM<CmdGetStatus>(10, 'cmdGetStatus', subBuilder: CmdGetStatus.create)
    ..aOM<RespGetStatus>(11, 'respGetStatus', subBuilder: RespGetStatus.create)
    ..aOM<CmdSetConfig>(12, 'cmdSetConfig', subBuilder: CmdSetConfig.create)
    ..aOM<RespSetConfig>(13, 'respSetConfig', subBuilder: RespSetConfig.create)
    ..aOM<CmdApplyConfig>(14, 'cmdApplyConfig', subBuilder: CmdApplyConfig.create)
    ..aOM<RespApplyConfig>(15, 'respApplyConfig', subBuilder: RespApplyConfig.create)
    ..hasRequiredFields = false
  ;

  WiFiConfigPayload._() : super();
  factory WiFiConfigPayload() => create();
  factory WiFiConfigPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WiFiConfigPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WiFiConfigPayload clone() => WiFiConfigPayload()..mergeFromMessage(this);
  WiFiConfigPayload copyWith(void Function(WiFiConfigPayload) updates) => super.copyWith((message) => updates(message as WiFiConfigPayload));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WiFiConfigPayload create() => WiFiConfigPayload._();
  WiFiConfigPayload createEmptyInstance() => create();
  static $pb.PbList<WiFiConfigPayload> createRepeated() => $pb.PbList<WiFiConfigPayload>();
  @$core.pragma('dart2js:noInline')
  static WiFiConfigPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WiFiConfigPayload>(create);
  static WiFiConfigPayload _defaultInstance;

  WiFiConfigPayload_Payload whichPayload() => _WiFiConfigPayload_PayloadByTag[$_whichOneof(0)];
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WiFiConfigMsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(WiFiConfigMsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(10)
  CmdGetStatus get cmdGetStatus => $_getN(1);
  @$pb.TagNumber(10)
  set cmdGetStatus(CmdGetStatus v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCmdGetStatus() => $_has(1);
  @$pb.TagNumber(10)
  void clearCmdGetStatus() => clearField(10);
  @$pb.TagNumber(10)
  CmdGetStatus ensureCmdGetStatus() => $_ensure(1);

  @$pb.TagNumber(11)
  RespGetStatus get respGetStatus => $_getN(2);
  @$pb.TagNumber(11)
  set respGetStatus(RespGetStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRespGetStatus() => $_has(2);
  @$pb.TagNumber(11)
  void clearRespGetStatus() => clearField(11);
  @$pb.TagNumber(11)
  RespGetStatus ensureRespGetStatus() => $_ensure(2);

  @$pb.TagNumber(12)
  CmdSetConfig get cmdSetConfig => $_getN(3);
  @$pb.TagNumber(12)
  set cmdSetConfig(CmdSetConfig v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCmdSetConfig() => $_has(3);
  @$pb.TagNumber(12)
  void clearCmdSetConfig() => clearField(12);
  @$pb.TagNumber(12)
  CmdSetConfig ensureCmdSetConfig() => $_ensure(3);

  @$pb.TagNumber(13)
  RespSetConfig get respSetConfig => $_getN(4);
  @$pb.TagNumber(13)
  set respSetConfig(RespSetConfig v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRespSetConfig() => $_has(4);
  @$pb.TagNumber(13)
  void clearRespSetConfig() => clearField(13);
  @$pb.TagNumber(13)
  RespSetConfig ensureRespSetConfig() => $_ensure(4);

  @$pb.TagNumber(14)
  CmdApplyConfig get cmdApplyConfig => $_getN(5);
  @$pb.TagNumber(14)
  set cmdApplyConfig(CmdApplyConfig v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCmdApplyConfig() => $_has(5);
  @$pb.TagNumber(14)
  void clearCmdApplyConfig() => clearField(14);
  @$pb.TagNumber(14)
  CmdApplyConfig ensureCmdApplyConfig() => $_ensure(5);

  @$pb.TagNumber(15)
  RespApplyConfig get respApplyConfig => $_getN(6);
  @$pb.TagNumber(15)
  set respApplyConfig(RespApplyConfig v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRespApplyConfig() => $_has(6);
  @$pb.TagNumber(15)
  void clearRespApplyConfig() => clearField(15);
  @$pb.TagNumber(15)
  RespApplyConfig ensureRespApplyConfig() => $_ensure(6);
}

