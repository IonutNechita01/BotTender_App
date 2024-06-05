import 'dart:convert';

import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

@immutable
class WifiDeviceModel implements DeviceModel {
  const WifiDeviceModel({
    required this.id,
    required this.ip,
    required this.name,
    required this.maxAvailableIngredientsCount,
    required this.availableIngredients,
    this.imageUrl = 'assets/images/device_icon.jpeg',
  });

  factory WifiDeviceModel.fromJson(Map<String, dynamic> json) {
    return WifiDeviceModel(
      id: json['id'] as String,
      ip: json['ip'] as String,
      name: json['name'] as String,
      maxAvailableIngredientsCount: json['maxAvailableIngredientsCount'] as int,
      availableIngredients: (json['availableIngredients'] as List<dynamic>)
          .map(
            (ingredient) =>
                IngredientModel.fromJson(ingredient as Map<String, dynamic>),
          )
          .toList(),
      imageUrl: json['imageUrl'] as String? ?? 'assets/images/device_icon.jpeg',
    );
  }

  @override
  final String id;

  @override
  final String name;

  @override
  final List<IngredientModel> availableIngredients;

  @override
  final int maxAvailableIngredientsCount;

  @override
  final String imageUrl;

  final String ip;

  @override
  String get address => 'http://$ip:8000';

  @override
  Future<bool> connect() async {
    final response = await send(path: Endpoints.host);
    final connectSuccess = response != null;
    if (connectSuccess) {
      store.dispatch(SavePastConnectedDevicesAction(ip));
    }
    return connectSuccess;
  }

  @override
  Future<Map<String, dynamic>?> send({
    required String path,
    dynamic data,
  }) async {
    final url = Uri.parse(address + path);
    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response.statusCode == 200
          ? json.decode(response.body) as Map<String, dynamic>
          : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  WifiDeviceModel copyWith({
    String? id,
    String? name,
    String? address,
    int? maxAvailableIngredientsCount,
    List<IngredientModel>? availableIngredients,
    String? imageUrl,
  }) {
    return WifiDeviceModel(
      id: id ?? this.id,
      ip: ip,
      name: name ?? this.name,
      maxAvailableIngredientsCount:
          maxAvailableIngredientsCount ?? this.maxAvailableIngredientsCount,
      availableIngredients: availableIngredients ?? this.availableIngredients,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WifiDeviceModel && other.ip == ip;
  }

  @override
  int get hashCode => ip.hashCode;
}
