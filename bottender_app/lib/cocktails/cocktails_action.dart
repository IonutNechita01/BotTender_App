import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/models/cocktail_model/cocktail_model.dart';
import 'package:bottender_app/redux/app_state.dart';

class ToggleFilterAction extends ReduxAction<AppState> {
  final bool Function(CocktailModel) filter;

  ToggleFilterAction(this.filter);

  @override
  AppState reduce() {
    final filters = List<bool Function(CocktailModel)>.from(
      state.cocktailsState.filters,
    );
    filters.contains(filter) ? filters.remove(filter) : filters.add(filter);
    return state.copyWith.cocktailsState.call(filters: filters);
  }

  @override
  void after() => dispatch(ApplyFiltersAction());
}

class ApplyFiltersAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    final cocktails = [...state.cocktailsState.cocktails];
    final filteredCocktails = <CocktailModel>{};
    for (final filter in state.cocktailsState.filters) {
      filteredCocktails.addAll(cocktails.where(filter));
    }
    return state.copyWith.cocktailsState
        .call(filteredCocktails: filteredCocktails.toList());
  }
}

class SetSelectedCocktailAction extends ReduxAction<AppState> {
  final CocktailModel cocktail;

  SetSelectedCocktailAction(this.cocktail);

  @override
  AppState reduce() {
    return state.copyWith.cocktailState.call(selectedCocktail: cocktail);
  }
}
