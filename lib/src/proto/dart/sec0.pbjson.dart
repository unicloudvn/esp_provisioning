///
//  Generated code. Do not modify.
//  source: sec0.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Sec0MsgType$json = const {
  '1': 'Sec0MsgType',
  '2': const [
    const {'1': 'S0_Session_Command', '2': 0},
    const {'1': 'S0_Session_Response', '2': 1},
  ],
};

const S0SessionCmd$json = const {
  '1': 'S0SessionCmd',
};

const S0SessionResp$json = const {
  '1': 'S0SessionResp',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

const Sec0Payload$json = const {
  '1': 'Sec0Payload',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.Sec0MsgType', '10': 'msg'},
    const {'1': 'sc', '3': 20, '4': 1, '5': 11, '6': '.S0SessionCmd', '9': 0, '10': 'sc'},
    const {'1': 'sr', '3': 21, '4': 1, '5': 11, '6': '.S0SessionResp', '9': 0, '10': 'sr'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

