import 'package:bottender_app/cocktail/cocktail_detail_screen.dart';
import 'package:bottender_app/cocktails/cocktails_action.dart';
import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/filters.dart';
import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_card.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/standards/standard_search_bar.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class CocktailsScreen extends StatelessWidget {
  const CocktailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBarController = TextEditingController();
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) {
        return [
          state.cocktailsState.cocktails,
          state.cocktailsState.filteredCocktails,
          state.cocktailsState.savedCocktails,
        ];
      },
      builder: (context, store, state, dispatch, model, child) {
        final cocktails = state.cocktailsState.filters.isNotEmpty
            ? state.cocktailsState.filteredCocktails
            : state.cocktailsState.cocktails;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardSpacing.regular(),
            StandardSearchBar(
              controller: searchBarController,
              placeholder: 'search',
            ),
            StandardSpacing.regular(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StandardSelectableButton(
                    label: 'Saved',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterSavedCocktails),
                    onTap: () {
                      dispatch(ToggleFilterAction(fillterSavedCocktails));
                    },
                  ),
                  StandardSpacing.medium(),
                  StandardSelectableButton(
                    label: 'Alcoholic',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterAlcoholicCocktails),
                    onTap: () {
                      dispatch(ToggleFilterAction(fillterAlcoholicCocktails));
                    },
                  ),
                  StandardSpacing.medium(),
                  StandardSelectableButton(
                    label: 'Non-Alcoholic',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterNonAlcoholicCocktails),
                    onTap: () {
                      dispatch(
                        ToggleFilterAction(fillterNonAlcoholicCocktails),
                      );
                    },
                  ),
                  StandardSpacing.medium(),
                  StandardSelectableButton(
                    label: 'Available Cocktails',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterAvailableCocktails),
                    onTap: () {
                      dispatch(ToggleFilterAction(fillterAvailableCocktails));
                    },
                  ),
                  StandardSpacing.medium(),
                  StandardSelectableButton(
                    label: 'Missing < 2 Ingredients',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterAvailableCocktailsMissingTwo),
                    onTap: () {
                      dispatch(
                        ToggleFilterAction(
                          fillterAvailableCocktailsMissingTwo,
                        ),
                      );
                    },
                  ),
                  StandardSpacing.medium(),
                  StandardSelectableButton(
                    label: 'Missing < 1 Ingredients',
                    isSelected: state.cocktailsState.filters
                        .contains(fillterAvailableCocktailsMissingOne),
                    onTap: () {
                      dispatch(
                        ToggleFilterAction(
                          fillterAvailableCocktailsMissingOne,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: StandardSpacingSize.regular,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildCocktailCard(context, cocktails[index]);
              },
              separatorBuilder: (context, index) {
                return StandardSpacing.vertical(StandardSpacingSize.regular);
              },
              itemCount: cocktails.length,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCocktailCard(BuildContext context, CocktailModel cocktail) {
    return StandardCard(
      onTap: () {
        store.dispatch(SetSelectedCocktailAction(cocktail));
        StandardModal.showStandardModal<dynamic>(
          context: context,
          child: const CocktailDetailScreen(),
        );
      },
      color: AppThemeColor.cardBackground,
      padding: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: StandardBorder().borderRadius,
              child: StandardImage(
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.width * 0.3,
                padding: 0,
                url: cocktail.imageUrl,
              ),
            ),
          ),
          StandardSpacing.regular(),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StandardSpacing.regular(),
                Text(
                  cocktail.name,
                  style: StandardTextStyles().title.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                StandardSpacing.regular(),
                Text(
                  '''Ingredients: ${cocktail.ingredients.map((e) => e.subtype).join(", ")}''',
                  style: StandardTextStyles().callout.regular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
