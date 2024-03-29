// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  DevicesState get devicesState => throw _privateConstructorUsedError;
  InitState get initState => throw _privateConstructorUsedError;
  HomeState get homeState => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DevicesState devicesState, InitState initState, HomeState homeState)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DevicesState devicesState, InitState initState,
            HomeState homeState)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DevicesState devicesState, InitState initState,
            HomeState homeState)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAppState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {DevicesState devicesState, InitState initState, HomeState homeState});

  $DevicesStateCopyWith<$Res> get devicesState;
  $InitStateCopyWith<$Res> get initState;
  $HomeStateCopyWith<$Res> get homeState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devicesState = null,
    Object? initState = null,
    Object? homeState = null,
  }) {
    return _then(_value.copyWith(
      devicesState: null == devicesState
          ? _value.devicesState
          : devicesState // ignore: cast_nullable_to_non_nullable
              as DevicesState,
      initState: null == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as InitState,
      homeState: null == homeState
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DevicesStateCopyWith<$Res> get devicesState {
    return $DevicesStateCopyWith<$Res>(_value.devicesState, (value) {
      return _then(_value.copyWith(devicesState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InitStateCopyWith<$Res> get initState {
    return $InitStateCopyWith<$Res>(_value.initState, (value) {
      return _then(_value.copyWith(initState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<$Res> get homeState {
    return $HomeStateCopyWith<$Res>(_value.homeState, (value) {
      return _then(_value.copyWith(homeState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialAppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$InitialAppStateImplCopyWith(_$InitialAppStateImpl value,
          $Res Function(_$InitialAppStateImpl) then) =
      __$$InitialAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DevicesState devicesState, InitState initState, HomeState homeState});

  @override
  $DevicesStateCopyWith<$Res> get devicesState;
  @override
  $InitStateCopyWith<$Res> get initState;
  @override
  $HomeStateCopyWith<$Res> get homeState;
}

/// @nodoc
class __$$InitialAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InitialAppStateImpl>
    implements _$$InitialAppStateImplCopyWith<$Res> {
  __$$InitialAppStateImplCopyWithImpl(
      _$InitialAppStateImpl _value, $Res Function(_$InitialAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devicesState = null,
    Object? initState = null,
    Object? homeState = null,
  }) {
    return _then(_$InitialAppStateImpl(
      devicesState: null == devicesState
          ? _value.devicesState
          : devicesState // ignore: cast_nullable_to_non_nullable
              as DevicesState,
      initState: null == initState
          ? _value.initState
          : initState // ignore: cast_nullable_to_non_nullable
              as InitState,
      homeState: null == homeState
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState,
    ));
  }
}

/// @nodoc

class _$InitialAppStateImpl extends _InitialAppState {
  const _$InitialAppStateImpl(
      {this.devicesState = const DevicesState.initial(),
      this.initState = const InitState.initial(),
      this.homeState = const HomeState.initial()})
      : super._();

  @override
  @JsonKey()
  final DevicesState devicesState;
  @override
  @JsonKey()
  final InitState initState;
  @override
  @JsonKey()
  final HomeState homeState;

  @override
  String toString() {
    return 'AppState.initial(devicesState: $devicesState, initState: $initState, homeState: $homeState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAppStateImpl &&
            (identical(other.devicesState, devicesState) ||
                other.devicesState == devicesState) &&
            (identical(other.initState, initState) ||
                other.initState == initState) &&
            (identical(other.homeState, homeState) ||
                other.homeState == homeState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, devicesState, initState, homeState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialAppStateImplCopyWith<_$InitialAppStateImpl> get copyWith =>
      __$$InitialAppStateImplCopyWithImpl<_$InitialAppStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DevicesState devicesState, InitState initState, HomeState homeState)
        initial,
  }) {
    return initial(devicesState, initState, homeState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DevicesState devicesState, InitState initState,
            HomeState homeState)?
        initial,
  }) {
    return initial?.call(devicesState, initState, homeState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DevicesState devicesState, InitState initState,
            HomeState homeState)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(devicesState, initState, homeState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAppState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialAppState extends AppState {
  const factory _InitialAppState(
      {final DevicesState devicesState,
      final InitState initState,
      final HomeState homeState}) = _$InitialAppStateImpl;
  const _InitialAppState._() : super._();

  @override
  DevicesState get devicesState;
  @override
  InitState get initState;
  @override
  HomeState get homeState;
  @override
  @JsonKey(ignore: true)
  _$$InitialAppStateImplCopyWith<_$InitialAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
