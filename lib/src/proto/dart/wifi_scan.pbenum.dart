///
//  Generated code. Do not modify.
//  source: wifi_scan.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class WiFiScanMsgType extends $pb.ProtobufEnum {
  static const WiFiScanMsgType TypeCmdScanStart =
      WiFiScanMsgType._(0, 'TypeCmdScanStart');
  static const WiFiScanMsgType TypeRespScanStart =
      WiFiScanMsgType._(1, 'TypeRespScanStart');
  static const WiFiScanMsgType TypeCmdScanStatus =
      WiFiScanMsgType._(2, 'TypeCmdScanStatus');
  static const WiFiScanMsgType TypeRespScanStatus =
      WiFiScanMsgType._(3, 'TypeRespScanStatus');
  static const WiFiScanMsgType TypeCmdScanResult =
      WiFiScanMsgType._(4, 'TypeCmdScanResult');
  static const WiFiScanMsgType TypeRespScanResult =
      WiFiScanMsgType._(5, 'TypeRespScanResult');

  static const $core.List<WiFiScanMsgType> values = <WiFiScanMsgType>[
    TypeCmdScanStart,
    TypeRespScanStart,
    TypeCmdScanStatus,
    TypeRespScanStatus,
    TypeCmdScanResult,
    TypeRespScanResult,
  ];

  static final $core.Map<$core.int, WiFiScanMsgType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static WiFiScanMsgType valueOf($core.int value) => _byValue[value];

  const WiFiScanMsgType._($core.int v, $core.String n) : super(v, n);
}
