// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CocktailState {
  CocktailModel get selectedCocktail => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CocktailModel selectedCocktail, bool isEditing)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CocktailModel selectedCocktail, bool isEditing)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CocktailModel selectedCocktail, bool isEditing)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCocktailState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCocktailState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCocktailState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CocktailStateCopyWith<CocktailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailStateCopyWith<$Res> {
  factory $CocktailStateCopyWith(
          CocktailState value, $Res Function(CocktailState) then) =
      _$CocktailStateCopyWithImpl<$Res, CocktailState>;
  @useResult
  $Res call({CocktailModel selectedCocktail, bool isEditing});

  $CocktailModelCopyWith<$Res> get selectedCocktail;
}

/// @nodoc
class _$CocktailStateCopyWithImpl<$Res, $Val extends CocktailState>
    implements $CocktailStateCopyWith<$Res> {
  _$CocktailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCocktail = null,
    Object? isEditing = null,
  }) {
    return _then(_value.copyWith(
      selectedCocktail: null == selectedCocktail
          ? _value.selectedCocktail
          : selectedCocktail // ignore: cast_nullable_to_non_nullable
              as CocktailModel,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CocktailModelCopyWith<$Res> get selectedCocktail {
    return $CocktailModelCopyWith<$Res>(_value.selectedCocktail, (value) {
      return _then(_value.copyWith(selectedCocktail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialCocktailStateImplCopyWith<$Res>
    implements $CocktailStateCopyWith<$Res> {
  factory _$$InitialCocktailStateImplCopyWith(_$InitialCocktailStateImpl value,
          $Res Function(_$InitialCocktailStateImpl) then) =
      __$$InitialCocktailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CocktailModel selectedCocktail, bool isEditing});

  @override
  $CocktailModelCopyWith<$Res> get selectedCocktail;
}

/// @nodoc
class __$$InitialCocktailStateImplCopyWithImpl<$Res>
    extends _$CocktailStateCopyWithImpl<$Res, _$InitialCocktailStateImpl>
    implements _$$InitialCocktailStateImplCopyWith<$Res> {
  __$$InitialCocktailStateImplCopyWithImpl(_$InitialCocktailStateImpl _value,
      $Res Function(_$InitialCocktailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCocktail = null,
    Object? isEditing = null,
  }) {
    return _then(_$InitialCocktailStateImpl(
      selectedCocktail: null == selectedCocktail
          ? _value.selectedCocktail
          : selectedCocktail // ignore: cast_nullable_to_non_nullable
              as CocktailModel,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialCocktailStateImpl extends _InitialCocktailState {
  const _$InitialCocktailStateImpl(
      {this.selectedCocktail = const CocktailModel.initial(),
      this.isEditing = false})
      : super._();

  @override
  @JsonKey()
  final CocktailModel selectedCocktail;
  @override
  @JsonKey()
  final bool isEditing;

  @override
  String toString() {
    return 'CocktailState.initial(selectedCocktail: $selectedCocktail, isEditing: $isEditing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialCocktailStateImpl &&
            (identical(other.selectedCocktail, selectedCocktail) ||
                other.selectedCocktail == selectedCocktail) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCocktail, isEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCocktailStateImplCopyWith<_$InitialCocktailStateImpl>
      get copyWith =>
          __$$InitialCocktailStateImplCopyWithImpl<_$InitialCocktailStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CocktailModel selectedCocktail, bool isEditing)
        initial,
  }) {
    return initial(selectedCocktail, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CocktailModel selectedCocktail, bool isEditing)? initial,
  }) {
    return initial?.call(selectedCocktail, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CocktailModel selectedCocktail, bool isEditing)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(selectedCocktail, isEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialCocktailState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialCocktailState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialCocktailState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialCocktailState extends CocktailState {
  const factory _InitialCocktailState(
      {final CocktailModel selectedCocktail,
      final bool isEditing}) = _$InitialCocktailStateImpl;
  const _InitialCocktailState._() : super._();

  @override
  CocktailModel get selectedCocktail;
  @override
  bool get isEditing;
  @override
  @JsonKey(ignore: true)
  _$$InitialCocktailStateImplCopyWith<_$InitialCocktailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
