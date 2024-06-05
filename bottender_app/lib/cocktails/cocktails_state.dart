import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktails_state.freezed.dart';

@freezed
class CocktailsState with _$CocktailsState {
  const CocktailsState._();

  const factory CocktailsState.initial({
    @Default([]) List<CocktailModel> cocktails,
    @Default([]) List<CocktailModel> filteredCocktails,
    @Default([]) List<CocktailModel> savedCocktails,
    @Default([]) List<bool Function(CocktailModel)> filters,
  }) = _InitialCocktailsState;
}
     
