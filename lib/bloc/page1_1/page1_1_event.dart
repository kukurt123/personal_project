// flutter packages pub run build_runner build --delete-conflicting-outputs
import 'package:freezed_annotation/freezed_annotation.dart';
part 'page1_1_event.freezed.dart';

@freezed
abstract class Page1Event with _$Page1Event {
  const factory Page1Event.fetchSummary() = Page1EventSummary;
  const factory Page1Event.clicked() = Page1EventClicked;
  const factory Page1Event.waitTest() = Page1EventWaitTest;
}
