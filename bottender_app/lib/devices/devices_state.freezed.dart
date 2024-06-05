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
  List<WifiNetwork> get disponibleWifis => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DeviceModel? connectedDevice,
            Set<DeviceModel> devices,
            bool isSearching,
            List<WifiNetwork> disponibleWifis)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching, List<WifiNetwork> disponibleWifis)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching, List<WifiNetwork> disponibleWifis)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDevicesState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDevicesState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDevicesState value)? initial,
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
      bool isSearching,
      List<WifiNetwork> disponibleWifis});
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
    Object? disponibleWifis = null,
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
      disponibleWifis: null == disponibleWifis
          ? _value.disponibleWifis
          : disponibleWifis // ignore: cast_nullable_to_non_nullable
              as List<WifiNetwork>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialDevicesStateImplCopyWith<$Res>
    implements $DevicesStateCopyWith<$Res> {
  factory _$$InitialDevicesStateImplCopyWith(_$InitialDevicesStateImpl value,
          $Res Function(_$InitialDevicesStateImpl) then) =
      __$$InitialDevicesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeviceModel? connectedDevice,
      Set<DeviceModel> devices,
      bool isSearching,
      List<WifiNetwork> disponibleWifis});
}

/// @nodoc
class __$$InitialDevicesStateImplCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$InitialDevicesStateImpl>
    implements _$$InitialDevicesStateImplCopyWith<$Res> {
  __$$InitialDevicesStateImplCopyWithImpl(_$InitialDevicesStateImpl _value,
      $Res Function(_$InitialDevicesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedDevice = freezed,
    Object? devices = null,
    Object? isSearching = null,
    Object? disponibleWifis = null,
  }) {
    return _then(_$InitialDevicesStateImpl(
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
      disponibleWifis: null == disponibleWifis
          ? _value._disponibleWifis
          : disponibleWifis // ignore: cast_nullable_to_non_nullable
              as List<WifiNetwork>,
    ));
  }
}

/// @nodoc

class _$InitialDevicesStateImpl extends _InitialDevicesState {
  const _$InitialDevicesStateImpl(
      {this.connectedDevice,
      final Set<DeviceModel> devices = const {},
      this.isSearching = false,
      final List<WifiNetwork> disponibleWifis = const []})
      : _devices = devices,
        _disponibleWifis = disponibleWifis,
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
  final List<WifiNetwork> _disponibleWifis;
  @override
  @JsonKey()
  List<WifiNetwork> get disponibleWifis {
    if (_disponibleWifis is EqualUnmodifiableListView) return _disponibleWifis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disponibleWifis);
  }

  @override
  String toString() {
    return 'DevicesState.initial(connectedDevice: $connectedDevice, devices: $devices, isSearching: $isSearching, disponibleWifis: $disponibleWifis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialDevicesStateImpl &&
            (identical(other.connectedDevice, connectedDevice) ||
                other.connectedDevice == connectedDevice) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._disponibleWifis, _disponibleWifis));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      connectedDevice,
      const DeepCollectionEquality().hash(_devices),
      isSearching,
      const DeepCollectionEquality().hash(_disponibleWifis));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialDevicesStateImplCopyWith<_$InitialDevicesStateImpl> get copyWith =>
      __$$InitialDevicesStateImplCopyWithImpl<_$InitialDevicesStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DeviceModel? connectedDevice,
            Set<DeviceModel> devices,
            bool isSearching,
            List<WifiNetwork> disponibleWifis)
        initial,
  }) {
    return initial(connectedDevice, devices, isSearching, disponibleWifis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching, List<WifiNetwork> disponibleWifis)?
        initial,
  }) {
    return initial?.call(
        connectedDevice, devices, isSearching, disponibleWifis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeviceModel? connectedDevice, Set<DeviceModel> devices,
            bool isSearching, List<WifiNetwork> disponibleWifis)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(connectedDevice, devices, isSearching, disponibleWifis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDevicesState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDevicesState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDevicesState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialDevicesState extends DevicesState {
  const factory _InitialDevicesState(
      {final DeviceModel? connectedDevice,
      final Set<DeviceModel> devices,
      final bool isSearching,
      final List<WifiNetwork> disponibleWifis}) = _$InitialDevicesStateImpl;
  const _InitialDevicesState._() : super._();

  @override
  DeviceModel? get connectedDevice;
  @override
  Set<DeviceModel> get devices;
  @override
  bool get isSearching;
  @override
  List<WifiNetwork> get disponibleWifis;
  @override
  @JsonKey(ignore: true)
  _$$InitialDevicesStateImplCopyWith<_$InitialDevicesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
