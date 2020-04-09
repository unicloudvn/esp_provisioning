///
//  Generated code. Do not modify.
//  source: sec1.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Sec1MsgType extends $pb.ProtobufEnum {
  static const Sec1MsgType Session_Command0 = Sec1MsgType._(0, 'Session_Command0');
  static const Sec1MsgType Session_Response0 = Sec1MsgType._(1, 'Session_Response0');
  static const Sec1MsgType Session_Command1 = Sec1MsgType._(2, 'Session_Command1');
  static const Sec1MsgType Session_Response1 = Sec1MsgType._(3, 'Session_Response1');

  static const $core.List<Sec1MsgType> values = <Sec1MsgType> [
    Session_Command0,
    Session_Response0,
    Session_Command1,
    Session_Response1,
  ];

  static final $core.Map<$core.int, Sec1MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Sec1MsgType valueOf($core.int value) => _byValue[value];

  const Sec1MsgType._($core.int v, $core.String n) : super(v, n);
}

