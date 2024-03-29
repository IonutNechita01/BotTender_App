import 'dart:convert';
import 'dart:typed_data';

import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceModel extends BluetoothDevice implements DeviceModel {
  @override
  String get name => super.name!;

  @override
  final String? id;

  @override
  final List<IngredientModel> availableIngredients = [];

  late String? wifiIp;

  BluetoothDeviceModel({this.id, required super.address, required super.name, this.wifiIp});

  @override
  Future<bool> connect() async {
    final response = await send(path: Endpoints.host);
    if (response == null) {
      return false;
    }
    if (response['host']!.isNotEmpty) {
      store.dispatch(NavigateToConfigWifiOnDeviceAction(host: response['host']!));
    }
    return true;
  }

  @override
  Future<Map<String, dynamic>?> send(
      {dynamic data, required String path}) async {
    try {
      final connection = await BluetoothConnection.toAddress(address);
      if (connection.isConnected) {
        data = json.encode(data ?? {});
        connection.output.add(Uint8List.fromList('$path/$data'.codeUnits));
        await connection.output.allSent;
        final response = await connection.input?.first;
        await connection.finish();
        if (response == null) {
          return null;
        }
        return json.decode(String.fromCharCodes(response));
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  BluetoothDeviceModel copyWith({String? id, String? name}) {
    return BluetoothDeviceModel(
      id: id ?? this.id,
      address: address,
      name: name ?? this.name,
    );
  }

  @override
  operator ==(Object other) {
    return other is BluetoothDeviceModel && other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
