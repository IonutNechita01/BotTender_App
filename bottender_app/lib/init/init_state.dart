import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_state.freezed.dart';


@freezed
class InitState with _$InitState {
  const InitState._();

  const factory InitState.initial() = _InitState;
}
