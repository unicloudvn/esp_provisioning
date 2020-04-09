///
//  Generated code. Do not modify.
//  source: wifi_config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class WiFiConfigMsgType extends $pb.ProtobufEnum {
  static const WiFiConfigMsgType TypeCmdGetStatus = WiFiConfigMsgType._(0, 'TypeCmdGetStatus');
  static const WiFiConfigMsgType TypeRespGetStatus = WiFiConfigMsgType._(1, 'TypeRespGetStatus');
  static const WiFiConfigMsgType TypeCmdSetConfig = WiFiConfigMsgType._(2, 'TypeCmdSetConfig');
  static const WiFiConfigMsgType TypeRespSetConfig = WiFiConfigMsgType._(3, 'TypeRespSetConfig');
  static const WiFiConfigMsgType TypeCmdApplyConfig = WiFiConfigMsgType._(4, 'TypeCmdApplyConfig');
  static const WiFiConfigMsgType TypeRespApplyConfig = WiFiConfigMsgType._(5, 'TypeRespApplyConfig');

  static const $core.List<WiFiConfigMsgType> values = <WiFiConfigMsgType> [
    TypeCmdGetStatus,
    TypeRespGetStatus,
    TypeCmdSetConfig,
    TypeRespSetConfig,
    TypeCmdApplyConfig,
    TypeRespApplyConfig,
  ];

  static final $core.Map<$core.int, WiFiConfigMsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WiFiConfigMsgType valueOf($core.int value) => _byValue[value];

  const WiFiConfigMsgType._($core.int v, $core.String n) : super(v, n);
}

