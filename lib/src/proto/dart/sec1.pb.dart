///
//  Generated code. Do not modify.
//  source: sec1.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'constants.pbenum.dart' as $0;
import 'sec1.pbenum.dart';

export 'sec1.pbenum.dart';

class SessionCmd1 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SessionCmd1', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, 'clientVerifyData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SessionCmd1._() : super();
  factory SessionCmd1() => create();
  factory SessionCmd1.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionCmd1.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SessionCmd1 clone() => SessionCmd1()..mergeFromMessage(this);
  SessionCmd1 copyWith(void Function(SessionCmd1) updates) => super.copyWith((message) => updates(message as SessionCmd1));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionCmd1 create() => SessionCmd1._();
  SessionCmd1 createEmptyInstance() => create();
  static $pb.PbList<SessionCmd1> createRepeated() => $pb.PbList<SessionCmd1>();
  @$core.pragma('dart2js:noInline')
  static SessionCmd1 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionCmd1>(create);
  static SessionCmd1 _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get clientVerifyData => $_getN(0);
  @$pb.TagNumber(2)
  set clientVerifyData($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientVerifyData() => $_has(0);
  @$pb.TagNumber(2)
  void clearClientVerifyData() => clearField(2);
}

class SessionResp1 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SessionResp1', createEmptyInstance: create)
    ..e<$0.Status>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..a<$core.List<$core.int>>(3, 'deviceVerifyData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SessionResp1._() : super();
  factory SessionResp1() => create();
  factory SessionResp1.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionResp1.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SessionResp1 clone() => SessionResp1()..mergeFromMessage(this);
  SessionResp1 copyWith(void Function(SessionResp1) updates) => super.copyWith((message) => updates(message as SessionResp1));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionResp1 create() => SessionResp1._();
  SessionResp1 createEmptyInstance() => create();
  static $pb.PbList<SessionResp1> createRepeated() => $pb.PbList<SessionResp1>();
  @$core.pragma('dart2js:noInline')
  static SessionResp1 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionResp1>(create);
  static SessionResp1 _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get deviceVerifyData => $_getN(1);
  @$pb.TagNumber(3)
  set deviceVerifyData($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceVerifyData() => $_has(1);
  @$pb.TagNumber(3)
  void clearDeviceVerifyData() => clearField(3);
}

class SessionCmd0 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SessionCmd0', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'clientPubkey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SessionCmd0._() : super();
  factory SessionCmd0() => create();
  factory SessionCmd0.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionCmd0.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SessionCmd0 clone() => SessionCmd0()..mergeFromMessage(this);
  SessionCmd0 copyWith(void Function(SessionCmd0) updates) => super.copyWith((message) => updates(message as SessionCmd0));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionCmd0 create() => SessionCmd0._();
  SessionCmd0 createEmptyInstance() => create();
  static $pb.PbList<SessionCmd0> createRepeated() => $pb.PbList<SessionCmd0>();
  @$core.pragma('dart2js:noInline')
  static SessionCmd0 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionCmd0>(create);
  static SessionCmd0 _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get clientPubkey => $_getN(0);
  @$pb.TagNumber(1)
  set clientPubkey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientPubkey() => clearField(1);
}

class SessionResp0 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SessionResp0', createEmptyInstance: create)
    ..e<$0.Status>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..a<$core.List<$core.int>>(2, 'devicePubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'deviceRandom', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SessionResp0._() : super();
  factory SessionResp0() => create();
  factory SessionResp0.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionResp0.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SessionResp0 clone() => SessionResp0()..mergeFromMessage(this);
  SessionResp0 copyWith(void Function(SessionResp0) updates) => super.copyWith((message) => updates(message as SessionResp0));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionResp0 create() => SessionResp0._();
  SessionResp0 createEmptyInstance() => create();
  static $pb.PbList<SessionResp0> createRepeated() => $pb.PbList<SessionResp0>();
  @$core.pragma('dart2js:noInline')
  static SessionResp0 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionResp0>(create);
  static SessionResp0 _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get devicePubkey => $_getN(1);
  @$pb.TagNumber(2)
  set devicePubkey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevicePubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevicePubkey() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get deviceRandom => $_getN(2);
  @$pb.TagNumber(3)
  set deviceRandom($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceRandom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceRandom() => clearField(3);
}

enum Sec1Payload_Payload {
  sc0, 
  sr0, 
  sc1, 
  sr1, 
  notSet
}

class Sec1Payload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Sec1Payload_Payload> _Sec1Payload_PayloadByTag = {
    20 : Sec1Payload_Payload.sc0,
    21 : Sec1Payload_Payload.sr0,
    22 : Sec1Payload_Payload.sc1,
    23 : Sec1Payload_Payload.sr1,
    0 : Sec1Payload_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Sec1Payload', createEmptyInstance: create)
    ..oo(0, [20, 21, 22, 23])
    ..e<Sec1MsgType>(1, 'msg', $pb.PbFieldType.OE, defaultOrMaker: Sec1MsgType.Session_Command0, valueOf: Sec1MsgType.valueOf, enumValues: Sec1MsgType.values)
    ..aOM<SessionCmd0>(20, 'sc0', subBuilder: SessionCmd0.create)
    ..aOM<SessionResp0>(21, 'sr0', subBuilder: SessionResp0.create)
    ..aOM<SessionCmd1>(22, 'sc1', subBuilder: SessionCmd1.create)
    ..aOM<SessionResp1>(23, 'sr1', subBuilder: SessionResp1.create)
    ..hasRequiredFields = false
  ;

  Sec1Payload._() : super();
  factory Sec1Payload() => create();
  factory Sec1Payload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Sec1Payload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Sec1Payload clone() => Sec1Payload()..mergeFromMessage(this);
  Sec1Payload copyWith(void Function(Sec1Payload) updates) => super.copyWith((message) => updates(message as Sec1Payload));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Sec1Payload create() => Sec1Payload._();
  Sec1Payload createEmptyInstance() => create();
  static $pb.PbList<Sec1Payload> createRepeated() => $pb.PbList<Sec1Payload>();
  @$core.pragma('dart2js:noInline')
  static Sec1Payload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sec1Payload>(create);
  static Sec1Payload _defaultInstance;

  Sec1Payload_Payload whichPayload() => _Sec1Payload_PayloadByTag[$_whichOneof(0)];
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Sec1MsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(Sec1MsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(20)
  SessionCmd0 get sc0 => $_getN(1);
  @$pb.TagNumber(20)
  set sc0(SessionCmd0 v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasSc0() => $_has(1);
  @$pb.TagNumber(20)
  void clearSc0() => clearField(20);
  @$pb.TagNumber(20)
  SessionCmd0 ensureSc0() => $_ensure(1);

  @$pb.TagNumber(21)
  SessionResp0 get sr0 => $_getN(2);
  @$pb.TagNumber(21)
  set sr0(SessionResp0 v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasSr0() => $_has(2);
  @$pb.TagNumber(21)
  void clearSr0() => clearField(21);
  @$pb.TagNumber(21)
  SessionResp0 ensureSr0() => $_ensure(2);

  @$pb.TagNumber(22)
  SessionCmd1 get sc1 => $_getN(3);
  @$pb.TagNumber(22)
  set sc1(SessionCmd1 v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasSc1() => $_has(3);
  @$pb.TagNumber(22)
  void clearSc1() => clearField(22);
  @$pb.TagNumber(22)
  SessionCmd1 ensureSc1() => $_ensure(3);

  @$pb.TagNumber(23)
  SessionResp1 get sr1 => $_getN(4);
  @$pb.TagNumber(23)
  set sr1(SessionResp1 v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasSr1() => $_has(4);
  @$pb.TagNumber(23)
  void clearSr1() => clearField(23);
  @$pb.TagNumber(23)
  SessionResp1 ensureSr1() => $_ensure(4);
}

