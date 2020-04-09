///
//  Generated code. Do not modify.
//  source: wifi_config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const WiFiConfigMsgType$json = const {
  '1': 'WiFiConfigMsgType',
  '2': const [
    const {'1': 'TypeCmdGetStatus', '2': 0},
    const {'1': 'TypeRespGetStatus', '2': 1},
    const {'1': 'TypeCmdSetConfig', '2': 2},
    const {'1': 'TypeRespSetConfig', '2': 3},
    const {'1': 'TypeCmdApplyConfig', '2': 4},
    const {'1': 'TypeRespApplyConfig', '2': 5},
  ],
};

const CmdGetStatus$json = const {
  '1': 'CmdGetStatus',
};

const RespGetStatus$json = const {
  '1': 'RespGetStatus',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'sta_state', '3': 2, '4': 1, '5': 14, '6': '.WifiStationState', '10': 'staState'},
    const {'1': 'fail_reason', '3': 10, '4': 1, '5': 14, '6': '.WifiConnectFailedReason', '9': 0, '10': 'failReason'},
    const {'1': 'connected', '3': 11, '4': 1, '5': 11, '6': '.WifiConnectedState', '9': 0, '10': 'connected'},
  ],
  '8': const [
    const {'1': 'state'},
  ],
};

const CmdSetConfig$json = const {
  '1': 'CmdSetConfig',
  '2': const [
    const {'1': 'ssid', '3': 1, '4': 1, '5': 12, '10': 'ssid'},
    const {'1': 'passphrase', '3': 2, '4': 1, '5': 12, '10': 'passphrase'},
    const {'1': 'bssid', '3': 3, '4': 1, '5': 12, '10': 'bssid'},
    const {'1': 'channel', '3': 4, '4': 1, '5': 5, '10': 'channel'},
  ],
};

const RespSetConfig$json = const {
  '1': 'RespSetConfig',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

const CmdApplyConfig$json = const {
  '1': 'CmdApplyConfig',
};

const RespApplyConfig$json = const {
  '1': 'RespApplyConfig',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

const WiFiConfigPayload$json = const {
  '1': 'WiFiConfigPayload',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.WiFiConfigMsgType', '10': 'msg'},
    const {'1': 'cmd_get_status', '3': 10, '4': 1, '5': 11, '6': '.CmdGetStatus', '9': 0, '10': 'cmdGetStatus'},
    const {'1': 'resp_get_status', '3': 11, '4': 1, '5': 11, '6': '.RespGetStatus', '9': 0, '10': 'respGetStatus'},
    const {'1': 'cmd_set_config', '3': 12, '4': 1, '5': 11, '6': '.CmdSetConfig', '9': 0, '10': 'cmdSetConfig'},
    const {'1': 'resp_set_config', '3': 13, '4': 1, '5': 11, '6': '.RespSetConfig', '9': 0, '10': 'respSetConfig'},
    const {'1': 'cmd_apply_config', '3': 14, '4': 1, '5': 11, '6': '.CmdApplyConfig', '9': 0, '10': 'cmdApplyConfig'},
    const {'1': 'resp_apply_config', '3': 15, '4': 1, '5': 11, '6': '.RespApplyConfig', '9': 0, '10': 'respApplyConfig'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

