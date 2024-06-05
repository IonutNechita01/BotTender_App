// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  int get currentIndexPage => throw _privateConstructorUsedError;
  int get lastIndexPage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndexPage, int lastIndexPage) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndexPage, int lastIndexPage)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndexPage, int lastIndexPage)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialHomeState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialHomeState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialHomeState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({int currentIndexPage, int lastIndexPage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndexPage = null,
    Object? lastIndexPage = null,
  }) {
    return _then(_value.copyWith(
      currentIndexPage: null == currentIndexPage
          ? _value.currentIndexPage
          : currentIndexPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastIndexPage: null == lastIndexPage
          ? _value.lastIndexPage
          : lastIndexPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialHomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialHomeStateImplCopyWith(_$InitialHomeStateImpl value,
          $Res Function(_$InitialHomeStateImpl) then) =
      __$$InitialHomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndexPage, int lastIndexPage});
}

/// @nodoc
class __$$InitialHomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialHomeStateImpl>
    implements _$$InitialHomeStateImplCopyWith<$Res> {
  __$$InitialHomeStateImplCopyWithImpl(_$InitialHomeStateImpl _value,
      $Res Function(_$InitialHomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndexPage = null,
    Object? lastIndexPage = null,
  }) {
    return _then(_$InitialHomeStateImpl(
      currentIndexPage: null == currentIndexPage
          ? _value.currentIndexPage
          : currentIndexPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastIndexPage: null == lastIndexPage
          ? _value.lastIndexPage
          : lastIndexPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialHomeStateImpl extends _InitialHomeState {
  const _$InitialHomeStateImpl(
      {this.currentIndexPage = 0, this.lastIndexPage = 0})
      : super._();

  @override
  @JsonKey()
  final int currentIndexPage;
  @override
  @JsonKey()
  final int lastIndexPage;

  @override
  String toString() {
    return 'HomeState.initial(currentIndexPage: $currentIndexPage, lastIndexPage: $lastIndexPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialHomeStateImpl &&
            (identical(other.currentIndexPage, currentIndexPage) ||
                other.currentIndexPage == currentIndexPage) &&
            (identical(other.lastIndexPage, lastIndexPage) ||
                other.lastIndexPage == lastIndexPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndexPage, lastIndexPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialHomeStateImplCopyWith<_$InitialHomeStateImpl> get copyWith =>
      __$$InitialHomeStateImplCopyWithImpl<_$InitialHomeStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndexPage, int lastIndexPage) initial,
  }) {
    return initial(currentIndexPage, lastIndexPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndexPage, int lastIndexPage)? initial,
  }) {
    return initial?.call(currentIndexPage, lastIndexPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndexPage, int lastIndexPage)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currentIndexPage, lastIndexPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialHomeState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialHomeState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialHomeState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialHomeState extends HomeState {
  const factory _InitialHomeState(
      {final int currentIndexPage,
      final int lastIndexPage}) = _$InitialHomeStateImpl;
  const _InitialHomeState._() : super._();

  @override
  int get currentIndexPage;
  @override
  int get lastIndexPage;
  @override
  @JsonKey(ignore: true)
  _$$InitialHomeStateImplCopyWith<_$InitialHomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
