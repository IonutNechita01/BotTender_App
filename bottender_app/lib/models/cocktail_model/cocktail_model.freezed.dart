// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) {
  return _InitialCocktailModel.fromJson(json);
}

/// @nodoc
mixin _$CocktailModel {
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<IngredientModel> get ingredients => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get alcoholic => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCocktailModel value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCocktailModel value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCocktailModel value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailModelCopyWith<CocktailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailModelCopyWith<$Res> {
  factory $CocktailModelCopyWith(
          CocktailModel value, $Res Function(CocktailModel) then) =
      _$CocktailModelCopyWithImpl<$Res, CocktailModel>;
  @useResult
  $Res call(
      {String imageUrl,
      String name,
      List<IngredientModel> ingredients,
      String id,
      bool alcoholic});
}

/// @nodoc
class _$CocktailModelCopyWithImpl<$Res, $Val extends CocktailModel>
    implements $CocktailModelCopyWith<$Res> {
  _$CocktailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
    Object? ingredients = null,
    Object? id = null,
    Object? alcoholic = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alcoholic: null == alcoholic
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCocktailModelImplCopyWith<$Res>
    implements $CocktailModelCopyWith<$Res> {
  factory _$$InitialCocktailModelImplCopyWith(_$InitialCocktailModelImpl value,
          $Res Function(_$InitialCocktailModelImpl) then) =
      __$$InitialCocktailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageUrl,
      String name,
      List<IngredientModel> ingredients,
      String id,
      bool alcoholic});
}

/// @nodoc
class __$$InitialCocktailModelImplCopyWithImpl<$Res>
    extends _$CocktailModelCopyWithImpl<$Res, _$InitialCocktailModelImpl>
    implements _$$InitialCocktailModelImplCopyWith<$Res> {
  __$$InitialCocktailModelImplCopyWithImpl(_$InitialCocktailModelImpl _value,
      $Res Function(_$InitialCocktailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
    Object? ingredients = null,
    Object? id = null,
    Object? alcoholic = null,
  }) {
    return _then(_$InitialCocktailModelImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alcoholic: null == alcoholic
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitialCocktailModelImpl extends _InitialCocktailModel {
  const _$InitialCocktailModelImpl(
      {this.imageUrl = '',
      this.name = '',
      final List<IngredientModel> ingredients = const [],
      this.id = '',
      this.alcoholic = false})
      : _ingredients = ingredients,
        super._();

  factory _$InitialCocktailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitialCocktailModelImplFromJson(json);

  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String name;
  final List<IngredientModel> _ingredients;
  @override
  @JsonKey()
  List<IngredientModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool alcoholic;

  @override
  String toString() {
    return 'CocktailModel.initial(imageUrl: $imageUrl, name: $name, ingredients: $ingredients, id: $id, alcoholic: $alcoholic)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCocktailModelImplCopyWith<_$InitialCocktailModelImpl>
      get copyWith =>
          __$$InitialCocktailModelImplCopyWithImpl<_$InitialCocktailModelImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)
        initial,
  }) {
    return initial(imageUrl, name, ingredients, id, alcoholic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)?
        initial,
  }) {
    return initial?.call(imageUrl, name, ingredients, id, alcoholic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String name,
            List<IngredientModel> ingredients, String id, bool alcoholic)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(imageUrl, name, ingredients, id, alcoholic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCocktailModel value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCocktailModel value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCocktailModel value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InitialCocktailModelImplToJson(
      this,
    );
  }
}

abstract class _InitialCocktailModel extends CocktailModel {
  const factory _InitialCocktailModel(
      {final String imageUrl,
      final String name,
      final List<IngredientModel> ingredients,
      final String id,
      final bool alcoholic}) = _$InitialCocktailModelImpl;
  const _InitialCocktailModel._() : super._();

  factory _InitialCocktailModel.fromJson(Map<String, dynamic> json) =
      _$InitialCocktailModelImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String get name;
  @override
  List<IngredientModel> get ingredients;
  @override
  String get id;
  @override
  bool get alcoholic;
  @override
  @JsonKey(ignore: true)
  _$$InitialCocktailModelImplCopyWith<_$InitialCocktailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
