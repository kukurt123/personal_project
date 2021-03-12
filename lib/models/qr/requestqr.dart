import 'package:freezed_annotation/freezed_annotation.dart';
part 'requestqr.freezed.dart';
part 'requestqr.g.dart';

@freezed
abstract class RequestQr with _$RequestQr {
  factory RequestQr({String id, String name, String request, int payment}) =
      _RequestQr;

  factory RequestQr.fromJson(Map<String, dynamic> json) =>
      _$RequestQrFromJson(json);
}
