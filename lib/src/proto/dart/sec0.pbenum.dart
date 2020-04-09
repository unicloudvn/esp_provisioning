///
//  Generated code. Do not modify.
//  source: sec0.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Sec0MsgType extends $pb.ProtobufEnum {
  static const Sec0MsgType S0_Session_Command = Sec0MsgType._(0, 'S0_Session_Command');
  static const Sec0MsgType S0_Session_Response = Sec0MsgType._(1, 'S0_Session_Response');

  static const $core.List<Sec0MsgType> values = <Sec0MsgType> [
    S0_Session_Command,
    S0_Session_Response,
  ];

  static final $core.Map<$core.int, Sec0MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Sec0MsgType valueOf($core.int value) => _byValue[value];

  const Sec0MsgType._($core.int v, $core.String n) : super(v, n);
}

