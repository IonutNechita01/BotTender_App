import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices_state.freezed.dart';

@freezed
class DevicesState with _$DevicesState {
  const DevicesState._();

  const factory DevicesState.initial({
    DeviceModel? connectedDevice,
    @Default({})
    Set<DeviceModel> devices,
    @Default(false) bool isSearching,
    @Default([]) List<WifiNetwork> disponibleWifis,
  }) = _InitialDevicesState;
}
