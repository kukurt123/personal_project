import 'package:freezed_annotation/freezed_annotation.dart';
import 'order.dart';
part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  factory User({String name, List<Order> orders, List<Order> cart}) = _User;
}
