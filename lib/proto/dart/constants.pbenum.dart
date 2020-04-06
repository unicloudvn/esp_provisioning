///
//  Generated code. Do not modify.
//  source: constants.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Status extends $pb.ProtobufEnum {
  static const Status Success = Status._(0, 'Success');
  static const Status InvalidSecScheme = Status._(1, 'InvalidSecScheme');
  static const Status InvalidProto = Status._(2, 'InvalidProto');
  static const Status TooManySessions = Status._(3, 'TooManySessions');
  static const Status InvalidArgument = Status._(4, 'InvalidArgument');
  static const Status InternalError = Status._(5, 'InternalError');
  static const Status CryptoError = Status._(6, 'CryptoError');
  static const Status InvalidSession = Status._(7, 'InvalidSession');

  static const $core.List<Status> values = <Status> [
    Success,
    InvalidSecScheme,
    InvalidProto,
    TooManySessions,
    InvalidArgument,
    InternalError,
    CryptoError,
    InvalidSession,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}

