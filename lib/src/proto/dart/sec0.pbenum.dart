///
//  Generated code. Do not modify.
//  source: sec0.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Sec0MsgType extends $pb.ProtobufEnum {
  static const Sec0MsgType S0_Session_Command = Sec0MsgType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S0_Session_Command');
  static const Sec0MsgType S0_Session_Response = Sec0MsgType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S0_Session_Response');

  static const $core.List<Sec0MsgType> values = <Sec0MsgType> [
    S0_Session_Command,
    S0_Session_Response,
  ];

  static final $core.Map<$core.int, Sec0MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Sec0MsgType? valueOf($core.int value) => _byValue[value];

  const Sec0MsgType._($core.int v, $core.String n) : super(v, n);
}

