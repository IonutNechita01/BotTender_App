import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/main.dart';
import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/local_storage.dart';
import 'package:bottender_app/utils/standards/standard_loading_modal.dart';

class ToggleFavoriteAction extends ReduxAction<AppState> {
  final CocktailModel cocktail;

  ToggleFavoriteAction(this.cocktail);

  @override
  Future<AppState> reduce() async {
    final savedCocktails = [...state.cocktailsState.savedCocktails];
    if (savedCocktails.contains(cocktail)) {
      savedCocktails.remove(cocktail);
    } else {
      savedCocktails.add(cocktail);
    }
    await LocalStorage.saveData('savedCocktails',
        jsonEncode(savedCocktails.map((e) => e.toJson()).toList()),);
    return state.copyWith.cocktailsState.call(savedCocktails: savedCocktails);
  }
}

class PrepareCocktailAction extends ReduxAction<AppState> {
  final CocktailModel cocktail;

  PrepareCocktailAction(this.cocktail);

  @override
  Future<AppState?> reduce() async {
    final eligibleIngredients = [
      ...cocktail.ingredients.where((element) => element.name.isNotEmpty),
    ];
    StandardLoadingModal.showStandardLoadingModal(
        context: navigatorKey.currentContext!,);
    final response = await state.devicesState.connectedDevice?.send(
        path: Endpoints.prepareCocktail,
        data: cocktail.copyWith(ingredients: eligibleIngredients).toJson(),);
    print(response);
    StandardLoadingModal.hideStandardLoadingModal();
    return null;
  }
}
