import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail_state.freezed.dart';

@freezed
class CocktailState with _$CocktailState {
  const CocktailState._();

  const factory CocktailState.initial({
    @Default(CocktailModel.initial()) CocktailModel selectedCocktail,
    @Default(false) bool isEditing,
  }) = _InitialCocktailState;
}
