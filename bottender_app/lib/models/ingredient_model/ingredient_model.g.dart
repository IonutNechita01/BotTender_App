// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialIngredientModelImpl _$$InitialIngredientModelImplFromJson(
        Map<String, dynamic> json,) =>
    _$InitialIngredientModelImpl(
      name: json['name'] as String? ?? '',
      position: json['position'] as int? ?? -1,
      id: json['id'] as String? ?? '',
      imageUrl:
          json['imageUrl'] as String? ?? 'assets/images/ingredient_icon.png',
      barcode: json['barcode'] as String? ?? '',
      type: json['type'] as String? ?? '',
      subtype: json['subtype'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$InitialIngredientModelImplToJson(
        _$InitialIngredientModelImpl instance,) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'barcode': instance.barcode,
      'type': instance.type,
      'subtype': instance.subtype,
      'quantity': instance.quantity,
    };
