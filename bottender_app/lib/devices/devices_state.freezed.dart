// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DevicesState {
  DeviceModel? get connectedDevice => throw _privateConstructorUsedError;
  Set<DeviceModel> get devices => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceModel? connectedDevice,
            Set<DeviceModel> devices, bool isSearching)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevicesState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevicesState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevicesState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DevicesStateCopyWith<DevicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesStateCopyWith<$Res> {
  factory $DevicesStateCopyWith(
          DevicesState value, $Res Function(DevicesState) then) =
      _$DevicesStateCopyWithImpl<$Res, DevicesState>;
  @useResult
  $Res call(
      {DeviceModel? connectedDevice,
      Set<DeviceModel> devices,
      bool isSearching});
}

/// @nodoc
class _$DevicesStateCopyWithImpl<$Res, $Val extends DevicesState>
    implements $DevicesStateCopyWith<$Res> {
  _$DevicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedDevice = freezed,
    Object? devices = null,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      connectedDevice: freezed == connectedDevice
          ? _value.connectedDevice
          : connectedDevice // ignore: cast_nullable_to_non_nullable
              as DeviceModel?,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Set<DeviceModel>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevicesStateImplCopyWith<$Res>
    implements $DevicesStateCopyWith<$Res> {
  factory _$$DevicesStateImplCopyWith(
          _$DevicesStateImpl value, $Res Function(_$DevicesStateImpl) then) =
      __$$DevicesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeviceModel? connectedDevice,
      Set<DeviceModel> devices,
      bool isSearching});
}

/// @nodoc
class __$$DevicesStateImplCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$DevicesStateImpl>
    implements _$$DevicesStateImplCopyWith<$Res> {
  __$$DevicesStateImplCopyWithImpl(
      _$DevicesStateImpl _value, $Res Function(_$DevicesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedDevice = freezed,
    Object? devices = null,
    Object? isSearching = null,
  }) {
    return _then(_$DevicesStateImpl(
      connectedDevice: freezed == connectedDevice
          ? _value.connectedDevice
          : connectedDevice // ignore: cast_nullable_to_non_nullable
              as DeviceModel?,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Set<DeviceModel>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DevicesStateImpl extends _DevicesState {
  const _$DevicesStateImpl(
      {this.connectedDevice,
      final Set<DeviceModel> devices = const {},
      this.isSearching = false})
      : _devices = devices,
        super._();

  @override
  final DeviceModel? connectedDevice;
  final Set<DeviceModel> _devices;
  @override
  @JsonKey()
  Set<DeviceModel> get devices {
    if (_devices is EqualUnmodifiableSetView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_devices);
  }

  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'DevicesState.initial(connectedDevice: $connectedDevice, devices: $devices, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesStateImpl &&
            (identical(other.connectedDevice, connectedDevice) ||
                other.connectedDevice == connectedDevice) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectedDevice,
      const DeepCollectionEquality().hash(_devices), isSearching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicesStateImplCopyWith<_$DevicesStateImpl> get copyWith =>
      __$$DevicesStateImplCopyWithImpl<_$DevicesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeviceModel? connectedDevice,
            Set<DeviceModel> devices, bool isSearching)
        initial,
  }) {
    return initial(connectedDevice, devices, isSearching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching)?
        initial,
  }) {
    return initial?.call(connectedDevice, devices, isSearching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(connectedDevice, devices, isSearching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevicesState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevicesState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevicesState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DevicesState extends DevicesState {
  const factory _DevicesState(
      {final DeviceModel? connectedDevice,
      final Set<DeviceModel> devices,
      final bool isSearching}) = _$DevicesStateImpl;
  const _DevicesState._() : super._();

  @override
  DeviceModel? get connectedDevice;
  @override
  Set<DeviceModel> get devices;
  @override
  bool get isSearching;
  @override
  @JsonKey(ignore: true)
  _$$DevicesStateImplCopyWith<_$DevicesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
