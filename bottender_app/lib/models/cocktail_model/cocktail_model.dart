import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail_model.freezed.dart';
part 'cocktail_model.g.dart';

@freezed
@immutable
class CocktailModel with _$CocktailModel {
  const CocktailModel._();

  const factory CocktailModel.initial({
    @Default('') String imageUrl,
    @Default('') String name,
    @Default([]) List<IngredientModel> ingredients,
    @Default('') String id,
    @Default(false) bool alcoholic,
  }) = _InitialCocktailModel;

  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CocktailModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
