import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_practice/models/restaurant.dart';
import 'food.dart';
part 'order.freezed.dart';

@freezed
abstract class Order with _$Order {
  factory Order({Restaurant restaurant, Food food, String date, int quantity}) =
      _Order;
}
