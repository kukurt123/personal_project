import 'package:freezed_annotation/freezed_annotation.dart';
part 'fruit.freezed.dart';
part 'fruit.g.dart';

@freezed
abstract class Fruit with _$Fruit {
  factory Fruit(
      {String id,
      String name,
      double price,
      String gram,
      int fruitQty,
      String image}) = _Fruit;

  factory Fruit.fromJson(Map<String, dynamic> json) => _$FruitFromJson(json);
}
