import 'package:bottender_app/device/device_action.dart';
import 'package:bottender_app/ingredient/ingredient_action.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/standards/standard_card.dart';
import 'package:bottender_app/utils/standards/standard_horizontal_photo_scroller.dart';
import 'package:bottender_app/utils/standards/standard_list_tile.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) =>
          [state.devicesState.connectedDevice!.availableIngredients],
      builder: (context, store, state, dispatch, model, child) {
        final ingredients = _initIngredients(context);
        return StandardPadding.only(
          top: StandardSpacingSize.regular,
          bottom: StandardSpacingSize.regular,
          child: Column(
            children: [
              StandardCard(
                padding: 0,
                margin: const EdgeInsets.symmetric(
                  horizontal: StandardSpacingSize.medium,
                ),
                child: Column(
                  children: [
                    StandardSpacing.regular(),
                    StandardListTile(
                      title: state.devicesState.connectedDevice!.name,
                      subtitle: 'Device name',
                      imageUrl: 'assets/images/device_icon.jpeg',
                    ),
                    StandardSpacing.regular(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '''Maximus avaible ingredients: ${state.devicesState.connectedDevice!.maxAvailableIngredientsCount}''',
                          style: StandardTextStyles().callout.regular,
                        ),
                        Text(
                          '''Slots used: ${state.devicesState.connectedDevice!.availableIngredients.length}/${state.devicesState.connectedDevice!.maxAvailableIngredientsCount}''',
                          style: StandardTextStyles().callout.regular,
                        ),
                      ],
                    ),
                    StandardSpacing.regular(),
                  ],
                ),
              ),
              StandardSpacing.regular(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: StandardCard(
                  padding: StandardSpacingSize.medium,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StandardSpacing.small(),
                      Text(
                        'Ingredients',
                        style: StandardTextStyles().headline.regular,
                      ),
                      StandardSpacing.small(),
                      Expanded(
                        child: StandardHorizontalPhotoScroller(
                          items: ingredients,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<HorizontalPhotoModel> _initIngredients(BuildContext context) {
    final ingredients = <HorizontalPhotoModel>[];
    for (var i = 0;
        i <
            store.state.devicesState.connectedDevice!
                .maxAvailableIngredientsCount;
        i++) {
      final ingredient = store
          .state.devicesState.connectedDevice!.availableIngredients
          .firstWhere(
        (element) => element.position == i,
        orElse: () => const IngredientModel.initial(),
      );
      if (ingredient.position != -1) {
        ingredients.add(
          HorizontalPhotoModel(
            imageUrl: ingredient.imageUrl,
            title: ingredient.name,
            onTap: (index) {
              store
                ..dispatch(
                  SetSelectedIngredientAction(
                    ingredient: ingredient,
                    isEditable: false,
                  ),
                )
                ..dispatch(ShowIngredientDetailModalAction());
            },
            isDeleteble: true,
            onDelete: (posistion) =>
                store.dispatch(RemoveIngredientAction(position: posistion)),
          ),
        );
        continue;
      }
      ingredients.add(
        HorizontalPhotoModel(
          imageUrl: 'assets/images/ingredient_icon.png',
          title: 'Ingredient: ${i + 1}',
          onTap: (index) => StandardModal.showStandardModal<dynamic>(
            buttonsInRow: false,
            context: context,
            title: 'Add ingredient',
            description:
                '''Choose the method you want to add the ingredient to the device, you can scan the barcode or add it manually. If you want to cancel the operation, click on the cancel button.''',
            rightButtonText: 'Scan barcode code',
            onRightButtonTap: () {
              store.dispatch(
                AddIngredientAction(position: index, isFromBarcode: true),
              );
            },
            midleButtonText: 'Add manually',
            onMidleButtonTap: () {
              store.dispatch(AddIngredientAction(position: index));
            },
            leftButtonText: 'Cancel',
          ),
        ),
      );
    }
    return ingredients;
  }
}
