import 'package:freezed_annotation/freezed_annotation.dart';
part 'fruit_total.freezed.dart';
part 'fruit_total.g.dart';

@freezed
abstract class FruitTotal with _$FruitTotal {
  factory FruitTotal(
      {String totalId,
      String totalName,
      double totalPrice,
      int qty,
      String imageLocation}) = _FruitTotal;

  factory FruitTotal.fromJson(Map<String, dynamic> json) =>
      _$FruitTotalFromJson(json);
}
