import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
@immutable
class IngredientModel with _$IngredientModel {
  const IngredientModel._();

  const factory IngredientModel.initial({
    @Default('') String name,
    @Default(-1) int position,
    @Default('') String id,
    @Default('assets/images/ingredient_icon.png') String imageUrl,
    @Default('') String barcode,
    @Default('') String type,
    @Default('') String subtype,
    @Default(0.0) double quantity,
  }) = _InitialIngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
    
  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'quantity': quantity,
      'subtype': subtype,
      'type': type
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IngredientModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
