import 'package:bottender_app/cocktail/cocktail_state.dart';
import 'package:bottender_app/cocktails/cocktails_state.dart';
import 'package:bottender_app/devices/devices_state.dart';
import 'package:bottender_app/home/home_state.dart';
import 'package:bottender_app/ingredient/ingredient_state.dart';
import 'package:bottender_app/init/init_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();
  const factory AppState.initial({
    @Default(DevicesState.initial()) DevicesState devicesState,
    @Default(InitState.initial()) InitState initState,
    @Default(HomeState.initial()) HomeState homeState,
    @Default(IngredientState.initial()) IngredientState ingredientState,
    @Default(CocktailsState.initial()) CocktailsState cocktailsState,
    @Default(CocktailState.initial()) CocktailState cocktailState,
  }) = _InitialAppState;
}
