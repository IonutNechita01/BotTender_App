// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialCocktailModelImpl _$$InitialCocktailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InitialCocktailModelImpl(
      imageUrl: json['imageUrl'] as String? ?? '',
      name: json['name'] as String? ?? '',
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String? ?? '',
      alcoholic: json['alcoholic'] as bool? ?? false,
    );

Map<String, dynamic> _$$InitialCocktailModelImplToJson(
        _$InitialCocktailModelImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'id': instance.id,
      'alcoholic': instance.alcoholic,
    };
