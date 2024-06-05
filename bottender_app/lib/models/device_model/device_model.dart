import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DeviceModel {
  String get name;
  String get address;
  String? get id;
  List<IngredientModel> get availableIngredients;
  int get maxAvailableIngredientsCount;
  String get imageUrl;

  Future<bool> connect();
  Future<Map<String, dynamic>?> send({required String path, dynamic data});
  DeviceModel copyWith(
      {String? id,
      String? name,
      String? address,
      List<IngredientModel>? availableIngredients,
      int? maxAvailableIngredientsCount,
      String? imageUrl,});
}
