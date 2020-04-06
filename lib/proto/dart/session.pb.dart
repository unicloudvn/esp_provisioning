///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'sec0.pb.dart' as $1;
import 'sec1.pb.dart' as $2;

import 'session.pbenum.dart';

export 'session.pbenum.dart';

enum SessionData_Proto {
  sec0, 
  sec1, 
  notSet
}

class SessionData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SessionData_Proto> _SessionData_ProtoByTag = {
    10 : SessionData_Proto.sec0,
    11 : SessionData_Proto.sec1,
    0 : SessionData_Proto.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SessionData', createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..e<SecSchemeVersion>(2, 'secVer', $pb.PbFieldType.OE, defaultOrMaker: SecSchemeVersion.SecScheme0, valueOf: SecSchemeVersion.valueOf, enumValues: SecSchemeVersion.values)
    ..aOM<$1.Sec0Payload>(10, 'sec0', subBuilder: $1.Sec0Payload.create)
    ..aOM<$2.Sec1Payload>(11, 'sec1', subBuilder: $2.Sec1Payload.create)
    ..hasRequiredFields = false
  ;

  SessionData._() : super();
  factory SessionData() => create();
  factory SessionData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SessionData clone() => SessionData()..mergeFromMessage(this);
  SessionData copyWith(void Function(SessionData) updates) => super.copyWith((message) => updates(message as SessionData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionData create() => SessionData._();
  SessionData createEmptyInstance() => create();
  static $pb.PbList<SessionData> createRepeated() => $pb.PbList<SessionData>();
  @$core.pragma('dart2js:noInline')
  static SessionData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionData>(create);
  static SessionData _defaultInstance;

  SessionData_Proto whichProto() => _SessionData_ProtoByTag[$_whichOneof(0)];
  void clearProto() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  SecSchemeVersion get secVer => $_getN(0);
  @$pb.TagNumber(2)
  set secVer(SecSchemeVersion v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecVer() => $_has(0);
  @$pb.TagNumber(2)
  void clearSecVer() => clearField(2);

  @$pb.TagNumber(10)
  $1.Sec0Payload get sec0 => $_getN(1);
  @$pb.TagNumber(10)
  set sec0($1.Sec0Payload v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasSec0() => $_has(1);
  @$pb.TagNumber(10)
  void clearSec0() => clearField(10);
  @$pb.TagNumber(10)
  $1.Sec0Payload ensureSec0() => $_ensure(1);

  @$pb.TagNumber(11)
  $2.Sec1Payload get sec1 => $_getN(2);
  @$pb.TagNumber(11)
  set sec1($2.Sec1Payload v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSec1() => $_has(2);
  @$pb.TagNumber(11)
  void clearSec1() => clearField(11);
  @$pb.TagNumber(11)
  $2.Sec1Payload ensureSec1() => $_ensure(2);
}

