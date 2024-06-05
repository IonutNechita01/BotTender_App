import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/ingredient/ingredient_action.dart';
import 'package:bottender_app/main.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/enums.dart';
import 'package:bottender_app/utils/others/firebase_utils.dart';
import 'package:bottender_app/utils/standards/standard_loading_modal.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class AddIngredientAction extends ReduxAction<AppState> {
  final int position;
  final bool isFromBarcode;

  AddIngredientAction({
    required this.position,
    this.isFromBarcode = false,
  });

  @override
  Future<AppState?> reduce() async {
    if (!isFromBarcode) {
      dispatch(
        SetSelectedIngredientAction(
          ingredient: const IngredientModel.initial().copyWith(
            position: position,
          ),
        ),
      );
      return null;
    }

    final barcode = await _getBarcode();
    if (barcode == '-1' || barcode == null) {
      dispatch(
        SetSelectedIngredientAction(
          ingredient: const IngredientModel.initial(barcode: '-1'),
        ),
      );
      return null;
    }
    StandardLoadingModal.showStandardLoadingModal(
      context: navigatorKey.currentContext!,
    );
    try {
      await getIngredientFromDatabase(barcode);
    } catch (err) {
      if (err.toString() == 'Ingredient not found') {
        try {
          await getIngredientFromAPI(barcode);
        } catch (_) {}
        StandardLoadingModal.hideStandardLoadingModal();
      } else {
        StandardLoadingModal.hideStandardLoadingModal();
        StandardModal.showStandardModal<dynamic>(
          context: navigatorKey.currentContext!,
          title: 'Error',
          description:
              'An error occurred while fetching the ingredient. try again.',
        );
      }
    }
    return null;
  }

  Future<String?> _getBarcode() async {
    final barcode = await Navigator.push<String?>(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => const SimpleBarcodeScannerPage(
          isShowFlashIcon: true,
          lineColor: AppThemeColor.primaryCode,
        ),
      ),
    );
    return barcode;
  }

  Future<void> getIngredientFromDatabase(String barcode) async {
    try {
      final data = await getIngredientDataFromFirebase(barcode);
      final newIngredient = IngredientModel.fromJson(data).copyWith(
        position: position,
      );
      dispatch(
        SetSelectedIngredientAction(
          ingredient: newIngredient,
          isEditable: false,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getIngredientDataFromFirebase(
    String? barcode,
  ) async {
    try {
      final data = await db
          .collection(FirebaseCollections.ingredient)
          .where('barcode', isEqualTo: barcode)
          .limit(1)
          .get();
      if (data.docs.isEmpty) throw Exception('Ingredient not found');
      return data.docs.first.data();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getIngredientFromAPI(String barcode) async {
    var newIngredient = const IngredientModel.initial().copyWith(
      position: position,
      barcode: barcode,
    );
    try {
      final ingredientData = await getIngredientDataFromAPI(barcode);
      try {
        newIngredient = newIngredient.copyWith(
          name: (ingredientData as Map<String, Map<String, String>>)['product']
                  ?['brands'] ??
              '',
        );
      } catch (_) {}
      try {
        await getImageFileFromUrl(
          (ingredientData as Map<String, Map<String, String>>)['product']
                  ?['image_url'] ??
              '',
        );
      } catch (_) {}
      try {
        final ingredientCategories = _getCategories(
          (ingredientData as Map<String, Map<String, List<dynamic>>>)['product']
                  ?['_keywords'] ??
              [],
        );
        final ingredientType = ingredientCategories?['type'];
        final ingredientSubtype = ingredientCategories?['subtype'];
        newIngredient = newIngredient.copyWith(
          type: ingredientType ?? IngredientType.unknown.name,
          subtype: ingredientSubtype ?? '',
        );
      } catch (_) {}
      store.dispatch(SetSelectedIngredientAction(ingredient: newIngredient));
    } catch (_) {
      store.dispatch(SetSelectedIngredientAction(ingredient: newIngredient));
      rethrow;
    }
  }

  Future<dynamic> getIngredientDataFromAPI(String barcode) async {
    final data = await http.get(
      Uri.parse(OpenFoodFactsAPI.host + barcode),
    );
    final ingredientData = jsonDecode(data.body);
    return ingredientData;
  }

  Map<String, String>? _getCategories(List<dynamic> keyWords) {
    for (var index = 0;
        index < IngredientSubtypes.ingredientSubtypes.length;
        index++) {
      final type = IngredientSubtypes.ingredientSubtypes.keys.elementAt(index);
      for (final subtype in IngredientSubtypes.ingredientSubtypes[type]!) {
        if (keyWords.contains(subtype)) {
          return {
            'type': type,
            'subtype': subtype,
          };
        }
      }
    }
    return null;
  }

  Future<void> getImageFileFromUrl(String ingredientImageUrl) async {
    try {
      final response = await http.get(Uri.parse(ingredientImageUrl));
      final bytes = response.bodyBytes;
      final bytesCompressed = await FlutterImageCompress.compressWithList(
        bytes,
        minHeight: 512,
        minWidth: 512,
      );
      final tempPath = File(
        "${Directory.systemTemp.path}/${ingredientImageUrl.hashCode}.${ingredientImageUrl.split('.').last}",
      );
      await tempPath.writeAsBytes(bytesCompressed);
      dispatch(UpdateTempImageAction(tempImage: tempPath));
    } catch (_) {
      rethrow;
    }
  }

  @override
  void after() {
    StandardModal.hideStandardModal();
    if (state.ingredientState.selectedIngredient.barcode == '-1') return;
    dispatch(ShowIngredientDetailModalAction());
  }
}

class SetIngredientOnDeviceAction extends ReduxAction<AppState> {
  final IngredientModel ingredient;

  SetIngredientOnDeviceAction({required this.ingredient});

  @override
  AppState reduce() {
    final availableIngredients = [
      ...state.devicesState.connectedDevice!.availableIngredients
        ..removeWhere((element) => element.position == ingredient.position)
        ..add(ingredient),
    ];
    return state.copyWith.devicesState.call(
      connectedDevice: state.devicesState.connectedDevice?.copyWith(
        availableIngredients: availableIngredients,
      ),
    );
  }
}
