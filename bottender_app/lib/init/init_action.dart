import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/redux/app_state.dart';

class InitDevicesAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    await dispatchAsync(GetBluetoothDevicesAction());
    dispatch(GetWifiDevicesAction());
    await dispatchAsync(GetPastConnectedDevicesAction());
    return null;
  }
}

