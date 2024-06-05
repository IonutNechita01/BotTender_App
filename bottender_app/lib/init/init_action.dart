import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:bottender_app/models/wifi_device_model/wifi_device_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/firebase_utils.dart';
import 'package:bottender_app/utils/others/local_storage.dart';

class InitDevicesAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    await dispatchAndWait(GetBluetoothDevicesAction());
    // dispatch(GetPastConnectedDevicesAction());
    dispatch(GetWifiDevicesAction());
    return null;
  }
}

class InitCocktailsAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    try {
      final cocktails = <CocktailModel>[];
      final response = await db.collection(FirebaseCollections.cocktail).get();
      for (final doc in response.docs) {
        cocktails.add(CocktailModel.fromJson(doc.data()));
      }
      return state.copyWith.cocktailsState.call(cocktails: cocktails);
    } catch (_) {}
    return null;
  }
}

class InitFavoritesCocktailsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final favorites = <CocktailModel>[];
    final favoritesJson = await LocalStorage.getData('savedCocktails');
    if (favoritesJson != null) {
      final favoritesList =
          jsonDecode(favoritesJson) as List<dynamic>;
      for (final favorite in favoritesList) {
        favorites.add(CocktailModel.fromJson(favorite as Map<String, dynamic>));
      }
    }
    return state.copyWith.cocktailsState.call(savedCocktails: favorites);
  }
}

// TODO: Remove after testing
class SetDeviceForTestingAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    return state.copyWith.devicesState.call(
      connectedDevice: WifiDeviceModel.fromJson(const {
        'host': 'test',
        'name': 'test',
        'id': 'test',
        'maxAvailableIngredientsCount': 10,
        'availableIngredients': List,
      }),
    );
  }
}
