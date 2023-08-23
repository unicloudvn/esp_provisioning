///
//  Generated code. Do not modify.
//  source: wifi_constants.proto
//
//
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const WifiStationState$json = const {
  '1': 'WifiStationState',
  '2': const [
    const {'1': 'Connected', '2': 0},
    const {'1': 'Connecting', '2': 1},
    const {'1': 'Disconnected', '2': 2},
    const {'1': 'ConnectionFailed', '2': 3},
  ],
};

const WifiConnectFailedReason$json = const {
  '1': 'WifiConnectFailedReason',
  '2': const [
    const {'1': 'AuthError', '2': 0},
    const {'1': 'NetworkNotFound', '2': 1},
  ],
};

const WifiAuthMode$json = const {
  '1': 'WifiAuthMode',
  '2': const [
    const {'1': 'Open', '2': 0},
    const {'1': 'WEP', '2': 1},
    const {'1': 'WPA_PSK', '2': 2},
    const {'1': 'WPA2_PSK', '2': 3},
    const {'1': 'WPA_WPA2_PSK', '2': 4},
    const {'1': 'WPA2_ENTERPRISE', '2': 5},
  ],
};

const WifiConnectedState$json = const {
  '1': 'WifiConnectedState',
  '2': const [
    const {'1': 'ip4_addr', '3': 1, '4': 1, '5': 9, '10': 'ip4Addr'},
    const {
      '1': 'auth_mode',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.WifiAuthMode',
      '10': 'authMode'
    },
    const {'1': 'ssid', '3': 3, '4': 1, '5': 12, '10': 'ssid'},
    const {'1': 'bssid', '3': 4, '4': 1, '5': 12, '10': 'bssid'},
    const {'1': 'channel', '3': 5, '4': 1, '5': 5, '10': 'channel'},
  ],
};
