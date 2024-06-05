import 'dart:convert';

import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

@immutable
class BluetoothDeviceModel extends BluetoothDevice implements DeviceModel {
  const BluetoothDeviceModel({
    required this.id,
    required this.maxAvailableIngredientsCount,
    required this.availableIngredients,
    required super.address,
    required super.name,
    this.imageUrl = 'assets/images/device_icon.jpeg',
  });
  @override
  String get name => super.name!;

  @override
  final String id;

  @override
  final List<IngredientModel> availableIngredients;

  @override
  final int maxAvailableIngredientsCount;

  @override
  final String imageUrl;

  const BluetoothDeviceModel.initial({
    required super.address,
    required super.name,
    this.id = '',
    this.maxAvailableIngredientsCount = 0,
    this.availableIngredients = const [],
    this.imageUrl = 'assets/images/device_icon.jpeg',
  });

  @override
  Future<bool> connect() async {
    final response = await send(path: Endpoints.host);
    if ((response?['host'] as String).isEmpty) {
      store.dispatch(
        NavigateToConfigWifiOnDeviceAction(),
      );
    }
    return response != null;
  }

  @override
  Future<Map<String, dynamic>?> send({
    required String path,
    dynamic data,
  }) async {
    try {
      final connection = await BluetoothConnection.toAddress(address);
      if (connection.isConnected) {
        data = json.encode(data ?? {});
        connection.output.add(Uint8List.fromList('$path::$data'.codeUnits));
        await connection.output.allSent;
        final response = await connection.input?.first;
        await connection.finish();
        if (response == null) {
          return null;
        }
        return json.decode(String.fromCharCodes(response))
            as Map<String, dynamic>;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  BluetoothDeviceModel copyWith({
    String? id,
    String? name,
    String? address,
    int? maxAvailableIngredientsCount,
    List<IngredientModel>? availableIngredients,
    String? imageUrl,
  }) {
    return BluetoothDeviceModel(
      id: id ?? this.id,
      address: this.address,
      name: name ?? this.name,
      maxAvailableIngredientsCount:
          maxAvailableIngredientsCount ?? this.maxAvailableIngredientsCount,
      availableIngredients: availableIngredients ?? this.availableIngredients,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BluetoothDeviceModel && other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
