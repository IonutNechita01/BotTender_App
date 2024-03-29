import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState.initial({
    @Default(0) int currentIndexPage,
    @Default(0) int lastIndexPage,
  }) = _InitialHomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
