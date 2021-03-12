import 'package:freezed_annotation/freezed_annotation.dart';
part 'food.freezed.dart';

@freezed
abstract class Food with _$Food {
  factory Food({String imageUrl, String name, double price}) = _Food;
  // factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}
