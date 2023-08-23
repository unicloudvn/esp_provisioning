///
//  Generated code. Do not modify.
//  source: sec1.proto
//
//
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Sec1MsgType$json = const {
  '1': 'Sec1MsgType',
  '2': const [
    const {'1': 'Session_Command0', '2': 0},
    const {'1': 'Session_Response0', '2': 1},
    const {'1': 'Session_Command1', '2': 2},
    const {'1': 'Session_Response1', '2': 3},
  ],
};

const SessionCmd1$json = const {
  '1': 'SessionCmd1',
  '2': const [
    const {
      '1': 'client_verify_data',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'clientVerifyData'
    },
  ],
};

const SessionResp1$json = const {
  '1': 'SessionResp1',
  '2': const [
    const {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Status',
      '10': 'status'
    },
    const {
      '1': 'device_verify_data',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'deviceVerifyData'
    },
  ],
};

const SessionCmd0$json = const {
  '1': 'SessionCmd0',
  '2': const [
    const {'1': 'client_pubkey', '3': 1, '4': 1, '5': 12, '10': 'clientPubkey'},
  ],
};

const SessionResp0$json = const {
  '1': 'SessionResp0',
  '2': const [
    const {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Status',
      '10': 'status'
    },
    const {'1': 'device_pubkey', '3': 2, '4': 1, '5': 12, '10': 'devicePubkey'},
    const {'1': 'device_random', '3': 3, '4': 1, '5': 12, '10': 'deviceRandom'},
  ],
};

const Sec1Payload$json = const {
  '1': 'Sec1Payload',
  '2': const [
    const {
      '1': 'msg',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Sec1MsgType',
      '10': 'msg'
    },
    const {
      '1': 'sc0',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.SessionCmd0',
      '9': 0,
      '10': 'sc0'
    },
    const {
      '1': 'sr0',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.SessionResp0',
      '9': 0,
      '10': 'sr0'
    },
    const {
      '1': 'sc1',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.SessionCmd1',
      '9': 0,
      '10': 'sc1'
    },
    const {
      '1': 'sr1',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.SessionResp1',
      '9': 0,
      '10': 'sr1'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};
