///
//  Generated code. Do not modify.
//  source: wifi_scan.proto
//
//
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const WiFiScanMsgType$json = const {
  '1': 'WiFiScanMsgType',
  '2': const [
    const {'1': 'TypeCmdScanStart', '2': 0},
    const {'1': 'TypeRespScanStart', '2': 1},
    const {'1': 'TypeCmdScanStatus', '2': 2},
    const {'1': 'TypeRespScanStatus', '2': 3},
    const {'1': 'TypeCmdScanResult', '2': 4},
    const {'1': 'TypeRespScanResult', '2': 5},
  ],
};

const CmdScanStart$json = const {
  '1': 'CmdScanStart',
  '2': const [
    const {'1': 'blocking', '3': 1, '4': 1, '5': 8, '10': 'blocking'},
    const {'1': 'passive', '3': 2, '4': 1, '5': 8, '10': 'passive'},
    const {
      '1': 'group_channels',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'groupChannels'
    },
    const {'1': 'period_ms', '3': 4, '4': 1, '5': 13, '10': 'periodMs'},
  ],
};

const RespScanStart$json = const {
  '1': 'RespScanStart',
};

const CmdScanStatus$json = const {
  '1': 'CmdScanStatus',
};

const RespScanStatus$json = const {
  '1': 'RespScanStatus',
  '2': const [
    const {'1': 'scan_finished', '3': 1, '4': 1, '5': 8, '10': 'scanFinished'},
    const {'1': 'result_count', '3': 2, '4': 1, '5': 13, '10': 'resultCount'},
  ],
};

const CmdScanResult$json = const {
  '1': 'CmdScanResult',
  '2': const [
    const {'1': 'start_index', '3': 1, '4': 1, '5': 13, '10': 'startIndex'},
    const {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
  ],
};

const WiFiScanResult$json = const {
  '1': 'WiFiScanResult',
  '2': const [
    const {'1': 'ssid', '3': 1, '4': 1, '5': 12, '10': 'ssid'},
    const {'1': 'channel', '3': 2, '4': 1, '5': 13, '10': 'channel'},
    const {'1': 'rssi', '3': 3, '4': 1, '5': 5, '10': 'rssi'},
    const {'1': 'bssid', '3': 4, '4': 1, '5': 12, '10': 'bssid'},
    const {
      '1': 'auth',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.WifiAuthMode',
      '10': 'auth'
    },
  ],
};

const RespScanResult$json = const {
  '1': 'RespScanResult',
  '2': const [
    const {
      '1': 'entries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.WiFiScanResult',
      '10': 'entries'
    },
  ],
};

const WiFiScanPayload$json = const {
  '1': 'WiFiScanPayload',
  '2': const [
    const {
      '1': 'msg',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.WiFiScanMsgType',
      '10': 'msg'
    },
    const {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.Status',
      '10': 'status'
    },
    const {
      '1': 'cmd_scan_start',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CmdScanStart',
      '9': 0,
      '10': 'cmdScanStart'
    },
    const {
      '1': 'resp_scan_start',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.RespScanStart',
      '9': 0,
      '10': 'respScanStart'
    },
    const {
      '1': 'cmd_scan_status',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.CmdScanStatus',
      '9': 0,
      '10': 'cmdScanStatus'
    },
    const {
      '1': 'resp_scan_status',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.RespScanStatus',
      '9': 0,
      '10': 'respScanStatus'
    },
    const {
      '1': 'cmd_scan_result',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.CmdScanResult',
      '9': 0,
      '10': 'cmdScanResult'
    },
    const {
      '1': 'resp_scan_result',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.RespScanResult',
      '9': 0,
      '10': 'respScanResult'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};
