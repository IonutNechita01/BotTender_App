import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:network_info_plus/network_info_plus.dart';

class SendWifiAction extends ReduxAction<AppState> {
  final String ssid;
  final String password;

  SendWifiAction({required this.ssid, required this.password});

  @override
  Future<AppState?> reduce() async {
    final response =
        await store.state.devicesState.connectedDevice!.send(data: {
      'ssid': ssid,
      'password': password,
    }, path: 'wifi-credentials',);
    if (response?['status'] == '0') {
      // TODO: Show ok dialog
    } else {
      // TODO: Show error dialog
      return null;
    }
    store.dispatch(NavigateAction.pushReplacementNamed(Routes.homeScreen));
    return null;
  }
}

class GetWifisAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final disponibleWifis = <WifiNetwork>[];
    final wifis = await AndroidFlutterWifi.getWifiScanResult();
    final connectedWifiName =
        (await NetworkInfo().getWifiName())?.replaceAll('"', '');
    wifis..sort((a, b) {
      if (a.ssid == connectedWifiName) return -1;
      if (b.ssid == connectedWifiName) return 1;
      if (a.level == null || b.level == null) return 0;
      return b.level!.compareTo(a.level!);
    })
    ..removeWhere((element) => element.ssid == '');
    disponibleWifis.addAll(wifis);
    print(disponibleWifis.length);
    return state.copyWith.devicesState.call(disponibleWifis: disponibleWifis);
  }
}
