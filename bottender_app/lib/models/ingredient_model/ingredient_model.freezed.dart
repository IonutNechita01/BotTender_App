// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IngredientModel {
  String get name => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  IngredientType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int? position, String id,
            String imageUrl, String description, IngredientType type)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int? position, String id, String imageUrl,
            String description, IngredientType type)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int? position, String id, String imageUrl,
            String description, IngredientType type)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIngredientModel value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIngredientModel value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIngredientModel value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call(
      {String name,
      int? position,
      String id,
      String imageUrl,
      String description,
      IngredientType type});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = freezed,
    Object? id = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IngredientType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialIngredientModelImplCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$InitialIngredientModelImplCopyWith(
          _$InitialIngredientModelImpl value,
          $Res Function(_$InitialIngredientModelImpl) then) =
      __$$InitialIngredientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? position,
      String id,
      String imageUrl,
      String description,
      IngredientType type});
}

/// @nodoc
class __$$InitialIngredientModelImplCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$InitialIngredientModelImpl>
    implements _$$InitialIngredientModelImplCopyWith<$Res> {
  __$$InitialIngredientModelImplCopyWithImpl(
      _$InitialIngredientModelImpl _value,
      $Res Function(_$InitialIngredientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? position = freezed,
    Object? id = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_$InitialIngredientModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IngredientType,
    ));
  }
}

/// @nodoc

class _$InitialIngredientModelImpl extends _InitialIngredientModel {
  const _$InitialIngredientModelImpl(
      {this.name = '',
      this.position = null,
      this.id = '',
      this.imageUrl = '',
      this.description = '',
      this.type = IngredientType.unknown})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int? position;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final IngredientType type;

  @override
  String toString() {
    return 'IngredientModel.initial(name: $name, position: $position, id: $id, imageUrl: $imageUrl, description: $description, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialIngredientModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, position, id, imageUrl, description, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialIngredientModelImplCopyWith<_$InitialIngredientModelImpl>
      get copyWith => __$$InitialIngredientModelImplCopyWithImpl<
          _$InitialIngredientModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int? position, String id,
            String imageUrl, String description, IngredientType type)
        initial,
  }) {
    return initial(name, position, id, imageUrl, description, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int? position, String id, String imageUrl,
            String description, IngredientType type)?
        initial,
  }) {
    return initial?.call(name, position, id, imageUrl, description, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int? position, String id, String imageUrl,
            String description, IngredientType type)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(name, position, id, imageUrl, description, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIngredientModel value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIngredientModel value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIngredientModel value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialIngredientModel extends IngredientModel {
  const factory _InitialIngredientModel(
      {final String name,
      final int? position,
      final String id,
      final String imageUrl,
      final String description,
      final IngredientType type}) = _$InitialIngredientModelImpl;
  const _InitialIngredientModel._() : super._();

  @override
  String get name;
  @override
  int? get position;
  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  IngredientType get type;
  @override
  @JsonKey(ignore: true)
  _$$InitialIngredientModelImplCopyWith<_$InitialIngredientModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
