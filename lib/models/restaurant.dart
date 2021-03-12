import 'package:freezed_annotation/freezed_annotation.dart';

import 'food.dart';
part 'restaurant.freezed.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  factory Restaurant(
      {String imageUrl,
      String name,
      String address,
      int rating,
      final List<Food> menu}) = _Restaurant;
  // factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}
