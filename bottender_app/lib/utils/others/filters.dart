import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:bottender_app/redux/store.dart';

bool fillterAvailableCocktails(CocktailModel cocktail) {
  return fillterAvailableCocktailsMissing(cocktail, 0);
}

bool fillterAvailableCocktailsMissingOne(CocktailModel cocktail) {
  return fillterAvailableCocktailsMissing(cocktail, 1);
}

bool fillterAvailableCocktailsMissingTwo(CocktailModel cocktail) {
  return fillterAvailableCocktailsMissing(cocktail, 2);
}

bool fillterAvailableCocktailsMissing(CocktailModel cocktail, int missing) {
  final availableIngredientsSubtype = store
      .state.devicesState.connectedDevice?.availableIngredients
      .map((e) => e.subtype)
      .toList();
  final requiredIngredientsSubtype =
      cocktail.ingredients.map((e) => e.subtype).toList();
  return requiredIngredientsSubtype
          .where((element) =>
              availableIngredientsSubtype?.contains(element) ?? false,)
          .length >=
      requiredIngredientsSubtype.length - missing;
}

bool fillterAlcoholicCocktails(CocktailModel cocktail) {
  return cocktail.alcoholic;
}

bool fillterNonAlcoholicCocktails(CocktailModel cocktail) {
  return !cocktail.alcoholic;
}

bool fillterSavedCocktails(CocktailModel cocktail) {
  return store.state.cocktailsState.savedCocktails.contains(cocktail);
}
