import 'package:freezed_annotation/freezed_annotation.dart';
part 'page1_1_state.freezed.dart';

@freezed
abstract class Page1State with _$Page1State {
  const factory Page1State.loading() = _page1StateLoading;
  const factory Page1State.calculate() = _page1StateCalculate;
  const factory Page1State.error() = _page1StateError;
}
