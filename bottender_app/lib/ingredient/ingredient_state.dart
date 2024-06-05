import 'dart:io';

import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

@freezed
class IngredientState with _$IngredientState {
  const IngredientState._();

  const factory IngredientState.initial({
    @Default(IngredientModel.initial()) IngredientModel selectedIngredient,
    @Default(true) bool isEditable,
    File? tempImage,
  }) = _InitialIngredientState;
}
