import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/main.dart';
import 'package:bottender_app/models/bluetooth_device_model/bluetooth_device_model.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:bottender_app/models/wifi_device_model/wifi_device_model.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/local_storage.dart';
import 'package:bottender_app/utils/standards/standard_loading_modal.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:http/http.dart' as http;

import 'package:bottender_app/redux/app_state.dart';
import 'package:lan_scanner/lan_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';

class GetBluetoothDevicesAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    for (final device in devices) {
      if (device.name != 'raspberrypi') {
        continue;
      }
      var newDevice = BluetoothDeviceModel(
        address: device.address,
        name: device.name,
      );
      final response = await newDevice.send(path: Endpoints.info);
      if (response != null) {
        newDevice = newDevice.copyWith(id: response['id']);
        dispatch(AddDeviceAction(newDevice));
      }
    }
    return null;
  }
}

class ToggleSearchingAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    return state.copyWith.devicesState
        .call(isSearching: !state.devicesState.isSearching);
  }
}

class GetWifiDevicesAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    dispatch(ToggleSearchingAction());
    final scanner = LanScanner();
    final myIp = await NetworkInfo().getWifiIP();
    final subnet = myIp?.substring(0, myIp.lastIndexOf('.'));
    final hosts = scanner.icmpScan(subnet ?? '192.168.0');
    hosts.listen((host) async {
      try {
        final url = Uri.parse(
            'http://${host.internetAddress.address}:8000/${Endpoints.info}');
        final response = await http.get(url);
        dispatch(
          AddDeviceAction(
            WifiDeviceModel.fromJson(jsonDecode(response.body)),
          ),
        );
      } catch (e) {
        return;
      }
    }).onDone(() {
      print('done');
      dispatch(ToggleSearchingAction());
    });
    return null;
  }
}

class AddDeviceAction extends ReduxAction<AppState> {
  final DeviceModel newDevice;

  AddDeviceAction(this.newDevice);

  @override
  AppState? reduce() {
    print(newDevice.name);
    final devices = Set<DeviceModel>.from(state.devicesState.devices);
    if (devices.contains(newDevice)) {
      return null;
    }
    devices.add(newDevice);
    return state.copyWith.devicesState.call(devices: devices);
  }
}

class ConnectDeviceAction extends ReduxAction<AppState> {
  final DeviceModel device;

  ConnectDeviceAction(this.device);

  @override
  Future<AppState?> reduce() async {
    final context = navigatorKey.currentContext!;
    StandardLoadingModal.showStandardLoadingModal(context: context);
    final isConnected = await device.connect();
    StandardLoadingModal.hideStandardLoadingModal();
    if (!isConnected) {
      // TODO: Show error message
      // dispatch(RemoveDeviceAction(device));
      return null;
    }
    return state.copyWith.devicesState.call(connectedDevice: device);
  }

  @override
  void after() {
    if (store.state.devicesState.connectedDevice != null) {
      dispatch(NavigateAction.pushReplacementNamed(Routes.homeScreen));
    }
  }
}

class NavigateToConfigWifiOnDeviceAction extends ReduxAction<AppState> {
  final String host;

  NavigateToConfigWifiOnDeviceAction({required this.host}); 

  @override
  Future<AppState?> reduce() async {
    await store.waitCondition((state) => state.devicesState.connectedDevice != null);
    dispatch(NavigateAction.pushNamed(Routes.configDevice));
    return null;
  }
}

class GetPastConnectedDevicesAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final pastConnectedIps = await LocalStorage.getData('pastConnectedIps');
    for (final ip in pastConnectedIps?.split(',') ?? []) {
      try {
        final url = Uri.parse('http://$ip:8000/${Endpoints.info}');
        final response = await http.get(url);
        // dispatch(
        //   AddDeviceAction(
        //     WifiDeviceModel.fromJson(jsonDecode(response.body)),
        //   ),
        // );
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

class RemoveDeviceAction extends ReduxAction<AppState> {
  final DeviceModel device;

  RemoveDeviceAction(this.device);

  @override
  AppState? reduce() {
    final devices = Set<DeviceModel>.from(state.devicesState.devices);
    devices.remove(device);
    return state.copyWith.devicesState.call(devices: devices);
  }
}

class SavePastConnectedDevicesAction extends ReduxAction<AppState> {
  final String ip;

  SavePastConnectedDevicesAction(this.ip);

  @override
  Future<AppState?> reduce() async {
    await LocalStorage.saveData(
      'pastConnectedIps',
      '$ip,${await LocalStorage.getData('pastConnectedIps')}',
    );
    return null;
  }
}
