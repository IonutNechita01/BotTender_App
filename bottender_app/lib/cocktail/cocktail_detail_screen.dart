import 'package:bottender_app/cocktail/cocktail_action.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_dropdown.dart';
import 'package:bottender_app/utils/standards/standard_field.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class CocktailDetailScreen extends StatefulWidget {
  const CocktailDetailScreen({super.key});

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  final cocktail = store.state.cocktailState.selectedCocktail;
  final cocktailIngredients = [
    ...store.state.cocktailState.selectedCocktail.ingredients,
  ];
  final quantitiyControllers = <TextEditingController>[];
  bool initial = true;

  @override
  Widget build(BuildContext context) {
    if (initial) {
      _initAvaibleIngredients();
      initial = false;
    }
    return AppLayout(
        safeArea: false,
        title: 'Cocktail Detail',
        actions: [
          ReduxSelector<AppState, List<dynamic>?>(
            selector: (context, state) => [state.cocktailsState.savedCocktails],
            builder: (context, store, state, dispatch, model, child) =>
                StandardIconButton(
                    color: AppThemeColor.error,
                    icon: state.cocktailsState.savedCocktails.contains(cocktail)
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    onTap: () {
                      dispatch(ToggleFavoriteAction(cocktail));
                    },),
          ),
        ],
        bottomButtonLabel: 'Prepare',
        secondBottomButtonLabel: 'Cancel',
        bottomButtonFunction: () {
          for (var index = 0; index < cocktailIngredients.length; index++) {
            cocktailIngredients[index] = cocktailIngredients[index].copyWith(
                quantity:
                    double.tryParse(quantitiyControllers[index].text) ?? 0,);
          }
          store.dispatch(PrepareCocktailAction(
              cocktail.copyWith(ingredients: cocktailIngredients),),);
        },
        secondBottomButtonFunction: StandardModal.hideStandardModal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StandardSpacing.regular(),
              Text('Name: ${cocktail.name}',
                  style: StandardTextStyles().title.bold,),
              StandardSpacing.regular(),
              StandardImage(url: cocktail.imageUrl),
              StandardSpacing.regular(),
              Column(
                children: [
                  for (int index = 0;
                      index < cocktailIngredients.length;
                      index++)
                    buildIngredient(index: index, context: context),
                  Container(
                    decoration: BoxDecoration(
                      color: AppThemeColor.primary.withOpacity(0.6),
                      borderRadius: StandardBorder().borderRadius,
                    ),
                    child: StandardIconButton(
                      color: AppThemeColor.greyShadeNegative,
                      icon: FontAwesomeIcons.plus,
                      size: StandardIconSize().smallIcon,
                      onTap: () {
                        setState(() {
                          cocktailIngredients
                              .add(const IngredientModel.initial());
                          quantitiyControllers.add(TextEditingController());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),);
  }

  void _initAvaibleIngredients() {
    for (var index = 0; index < cocktailIngredients.length; index++) {
      final avaibleIngredients = store
              .state.devicesState.connectedDevice?.availableIngredients
              .where((e) => e.subtype == cocktailIngredients[index].subtype)
              .map((e) =>
                  e.copyWith(quantity: cocktailIngredients[index].quantity),)
              .toSet() ??
          {};
      final myIngredient = avaibleIngredients.firstWhere(
          (element) => element.subtype == cocktailIngredients[index].subtype,
          orElse: () => cocktailIngredients[index],);
      cocktailIngredients[index] = myIngredient;
      quantitiyControllers.add(TextEditingController());
      quantitiyControllers[index].text =
          cocktailIngredients[index].quantity.toString();
    }
  }

  Widget buildIngredient({
    required BuildContext context,
    required int index,
  }) {
    final quantityController = TextEditingController();
    final ingredientNameController = TextEditingController();
    final avaibleIngredients = store
        .state.devicesState.connectedDevice!.availableIngredients
        .where((e) =>
            e.subtype == cocktailIngredients[index].subtype ||
            cocktailIngredients[index].subtype.isEmpty,)
        .map(
          (e) => e.copyWith(quantity: cocktailIngredients[index].quantity),
        )
        .toSet();
    ingredientNameController.text = cocktailIngredients[index].name.isNotEmpty
        ? cocktailIngredients[index].name
        : cocktailIngredients[index].subtype.isNotEmpty
            ? cocktailIngredients[index].subtype
            : 'Please select an ingredient';
    quantityController.text = cocktailIngredients[index].quantity.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ingredient: ${cocktailIngredients[index].subtype}',
                style: StandardTextStyles().callout.bold,),
            StandardIconButton(
              color: AppThemeColor.greyShadeNegative,
              size: StandardIconSize().verySmallIcon,
              icon: FontAwesomeIcons.trashCan,
              onTap: () {
                if (cocktailIngredients[index].name.isNotEmpty) {
                  StandardModal.showStandardModal<dynamic>(
                      context: context,
                      title: 'Delete ingredient',
                      description:
                          'Are you sure you want to delete this ingredient?',
                      leftButtonText: 'Cancel',
                      rightButtonText: 'Delete',
                      onRightButtonTap: () {
                        setState(() {
                          quantitiyControllers.removeAt(index);
                          cocktailIngredients.removeAt(index);
                        });
                        StandardModal.hideStandardModal();
                      },
                      onLeftButtonTap: StandardModal.hideStandardModal,);
                  return;
                }
                setState(() {
                  quantitiyControllers.removeAt(index);
                  cocktailIngredients.removeAt(index);
                });
              },
            ),
          ],
        ),
        StandardSpacing.medium(),
        StandardField(
          controller: quantitiyControllers[index],
          label: 'Quantity',
          keyboardType: TextInputType.number,
        ),
        StandardSpacing.medium(),
        StandardDropdown(
          errorText: avaibleIngredients.isEmpty
              ? 'Ingredient not available. It will not be added to the cocktail'
              : null,
          items: avaibleIngredients.map((e) => e.name),
          controller: ingredientNameController,
          onSelected: (String? value) {
            final selectedIngredient = avaibleIngredients
                .firstWhere((element) => element.name == value);
            setState(() {
              cocktailIngredients[index] = selectedIngredient;
            });
          },
        ),
        StandardSpacing.regular(),
      ],
    );
  }
}
