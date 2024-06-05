import 'package:bottender_app/utils/others/enums.dart';

class Routes {
  static const String devicesScreen = '/devicesScreen';
  static const String configDevice = '/configDevice';
  static const String homeScreen = '/homeScreen';
}

class Response {
  static const String success = 'success';
  static const String error = 'error';
}

class Endpoints {
  static const String info = '/info';
  static const String host = '/host';
  static const String addIngredient = '/addIngredient';
  static const String removeIngredient = '/removeIngredient';
  static const String prepareCocktail = '/prepareCocktail';
}

class OpenFoodFactsAPI {
  static const String host = 'https://world.openfoodfacts.org/api/v0/product/';
}

class FirebaseCollections {
  static const String ingredient = 'ingredient';
  static const String cocktail = 'cocktail';
}

class FirebaseStoragePath {
  static const String ingredient = 'ingredient';
}

class IngredientSubtypes {
  static Map<String, List<String>> ingredientSubtypes = {
    IngredientType.juice.name: EnumUtils.getNames(JuiceType.values),
    IngredientType.spirit.name: EnumUtils.getNames(SpiritType.values),
    IngredientType.beer.name: EnumUtils.getNames(BeerType.values),
    IngredientType.wine.name: EnumUtils.getNames(WineType.values),
    IngredientType.liqueur.name: EnumUtils.getNames(LiqueurType.values),
    IngredientType.soda.name: EnumUtils.getNames(SodaType.values),
    IngredientType.syrup.name: EnumUtils.getNames(SyrupType.values),
  };
}
