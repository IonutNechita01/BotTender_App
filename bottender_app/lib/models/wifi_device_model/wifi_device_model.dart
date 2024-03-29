import 'dart:convert';

import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/models/device_model/device_model.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:http/http.dart' as http;

class WifiDeviceModel implements DeviceModel {
  @override
  final String? id;

  @override
  final String name;

  @override
  final List<IngredientModel> availableIngredients = [];
  final String ip;

  WifiDeviceModel({this.id, required this.ip, required this.name});

  @override
  String get address => "http://$ip:8000";

  @override
  Future<bool> connect() async {
    final response = await send(path: Endpoints.host);
    store.dispatch(SavePastConnectedDevicesAction(ip));
    return response != null;
  }

  @override
  Future<Map<String, dynamic>?> send(
      {dynamic data, required String path}) async {
    final url = Uri.parse('$address/$path');
    try {
      final response = await http.post(url, body: data);
      return response.statusCode == 200 ? json.decode(response.body) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  WifiDeviceModel copyWith({String? id, String? name}) {
    return WifiDeviceModel(
      id: id ?? this.id,
      ip: ip,
      name: name ?? this.name,
    );
  }

  static WifiDeviceModel fromJson(jsonDecode) {
    return WifiDeviceModel(
      ip: jsonDecode['host'],
      name: jsonDecode['name'],
      id: jsonDecode['id'],
    );
  }

  @override
  operator ==(Object other) {
    return other is WifiDeviceModel && other.ip == ip;
  }

  @override
  int get hashCode => ip.hashCode;
}
