// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IngredientState {
  IngredientModel get selectedIngredient => throw _privateConstructorUsedError;
  bool get isEditable => throw _privateConstructorUsedError;
  File? get tempImage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IngredientModel selectedIngredient,
            bool isEditable, File? tempImage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IngredientModel selectedIngredient, bool isEditable,
            File? tempImage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IngredientModel selectedIngredient, bool isEditable,
            File? tempImage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIngredientState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIngredientState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIngredientState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientStateCopyWith<IngredientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientStateCopyWith<$Res> {
  factory $IngredientStateCopyWith(
          IngredientState value, $Res Function(IngredientState) then) =
      _$IngredientStateCopyWithImpl<$Res, IngredientState>;
  @useResult
  $Res call(
      {IngredientModel selectedIngredient, bool isEditable, File? tempImage});

  $IngredientModelCopyWith<$Res> get selectedIngredient;
}

/// @nodoc
class _$IngredientStateCopyWithImpl<$Res, $Val extends IngredientState>
    implements $IngredientStateCopyWith<$Res> {
  _$IngredientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIngredient = null,
    Object? isEditable = null,
    Object? tempImage = freezed,
  }) {
    return _then(_value.copyWith(
      selectedIngredient: null == selectedIngredient
          ? _value.selectedIngredient
          : selectedIngredient // ignore: cast_nullable_to_non_nullable
              as IngredientModel,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      tempImage: freezed == tempImage
          ? _value.tempImage
          : tempImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IngredientModelCopyWith<$Res> get selectedIngredient {
    return $IngredientModelCopyWith<$Res>(_value.selectedIngredient, (value) {
      return _then(_value.copyWith(selectedIngredient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialIngredientStateImplCopyWith<$Res>
    implements $IngredientStateCopyWith<$Res> {
  factory _$$InitialIngredientStateImplCopyWith(
          _$InitialIngredientStateImpl value,
          $Res Function(_$InitialIngredientStateImpl) then) =
      __$$InitialIngredientStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IngredientModel selectedIngredient, bool isEditable, File? tempImage});

  @override
  $IngredientModelCopyWith<$Res> get selectedIngredient;
}

/// @nodoc
class __$$InitialIngredientStateImplCopyWithImpl<$Res>
    extends _$IngredientStateCopyWithImpl<$Res, _$InitialIngredientStateImpl>
    implements _$$InitialIngredientStateImplCopyWith<$Res> {
  __$$InitialIngredientStateImplCopyWithImpl(
      _$InitialIngredientStateImpl _value,
      $Res Function(_$InitialIngredientStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIngredient = null,
    Object? isEditable = null,
    Object? tempImage = freezed,
  }) {
    return _then(_$InitialIngredientStateImpl(
      selectedIngredient: null == selectedIngredient
          ? _value.selectedIngredient
          : selectedIngredient // ignore: cast_nullable_to_non_nullable
              as IngredientModel,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      tempImage: freezed == tempImage
          ? _value.tempImage
          : tempImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$InitialIngredientStateImpl extends _InitialIngredientState {
  const _$InitialIngredientStateImpl(
      {this.selectedIngredient = const IngredientModel.initial(),
      this.isEditable = true,
      this.tempImage})
      : super._();

  @override
  @JsonKey()
  final IngredientModel selectedIngredient;
  @override
  @JsonKey()
  final bool isEditable;
  @override
  final File? tempImage;

  @override
  String toString() {
    return 'IngredientState.initial(selectedIngredient: $selectedIngredient, isEditable: $isEditable, tempImage: $tempImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialIngredientStateImpl &&
            (identical(other.selectedIngredient, selectedIngredient) ||
                other.selectedIngredient == selectedIngredient) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.tempImage, tempImage) ||
                other.tempImage == tempImage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedIngredient, isEditable, tempImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialIngredientStateImplCopyWith<_$InitialIngredientStateImpl>
      get copyWith => __$$InitialIngredientStateImplCopyWithImpl<
          _$InitialIngredientStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IngredientModel selectedIngredient,
            bool isEditable, File? tempImage)
        initial,
  }) {
    return initial(selectedIngredient, isEditable, tempImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IngredientModel selectedIngredient, bool isEditable,
            File? tempImage)?
        initial,
  }) {
    return initial?.call(selectedIngredient, isEditable, tempImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IngredientModel selectedIngredient, bool isEditable,
            File? tempImage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(selectedIngredient, isEditable, tempImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIngredientState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIngredientState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIngredientState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialIngredientState extends IngredientState {
  const factory _InitialIngredientState(
      {final IngredientModel selectedIngredient,
      final bool isEditable,
      final File? tempImage}) = _$InitialIngredientStateImpl;
  const _InitialIngredientState._() : super._();

  @override
  IngredientModel get selectedIngredient;
  @override
  bool get isEditable;
  @override
  File? get tempImage;
  @override
  @JsonKey(ignore: true)
  _$$InitialIngredientStateImplCopyWith<_$InitialIngredientStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
