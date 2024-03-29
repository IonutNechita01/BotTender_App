import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';

abstract class DeviceModel {
  String get name;
  String get address;
  String? get id;
  List<IngredientModel> get availableIngredients;

  Future<bool> connect();
  Future<Map<String, dynamic>?> send({dynamic data, required String path});
  DeviceModel copyWith({String? id, String? name});
}
