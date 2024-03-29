import 'package:bottender_app/utils/others/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_model.freezed.dart';

@freezed
class IngredientModel with _$IngredientModel {
  const IngredientModel._();

  const factory IngredientModel.initial({
    @Default('') String name,
    @Default(null) int? position,
    @Default('') String id,
    @Default('') String imageUrl,
    @Default('') String description, 
    @Default(IngredientType.unknown) IngredientType type,
  }) = _InitialIngredientModel;
}