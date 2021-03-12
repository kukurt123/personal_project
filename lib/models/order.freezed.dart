// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

// ignore: unused_element
  _Order call({Restaurant restaurant, Food food, String date, int quantity}) {
    return _Order(
      restaurant: restaurant,
      food: food,
      date: date,
      quantity: quantity,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  Restaurant get restaurant;
  Food get food;
  String get date;
  int get quantity;

  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call({Restaurant restaurant, Food food, String date, int quantity});

  $RestaurantCopyWith<$Res> get restaurant;
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object restaurant = freezed,
    Object food = freezed,
    Object date = freezed,
    Object quantity = freezed,
  }) {
    return _then(_value.copyWith(
      restaurant:
          restaurant == freezed ? _value.restaurant : restaurant as Restaurant,
      food: food == freezed ? _value.food : food as Food,
      date: date == freezed ? _value.date : date as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
    ));
  }

  @override
  $RestaurantCopyWith<$Res> get restaurant {
    if (_value.restaurant == null) {
      return null;
    }
    return $RestaurantCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }

  @override
  $FoodCopyWith<$Res> get food {
    if (_value.food == null) {
      return null;
    }
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call({Restaurant restaurant, Food food, String date, int quantity});

  @override
  $RestaurantCopyWith<$Res> get restaurant;
  @override
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object restaurant = freezed,
    Object food = freezed,
    Object date = freezed,
    Object quantity = freezed,
  }) {
    return _then(_Order(
      restaurant:
          restaurant == freezed ? _value.restaurant : restaurant as Restaurant,
      food: food == freezed ? _value.food : food as Food,
      date: date == freezed ? _value.date : date as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
    ));
  }
}

/// @nodoc
class _$_Order implements _Order {
  _$_Order({this.restaurant, this.food, this.date, this.quantity});

  @override
  final Restaurant restaurant;
  @override
  final Food food;
  @override
  final String date;
  @override
  final int quantity;

  @override
  String toString() {
    return 'Order(restaurant: $restaurant, food: $food, date: $date, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Order &&
            (identical(other.restaurant, restaurant) ||
                const DeepCollectionEquality()
                    .equals(other.restaurant, restaurant)) &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restaurant) ^
      const DeepCollectionEquality().hash(food) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(quantity);

  @JsonKey(ignore: true)
  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);
}

abstract class _Order implements Order {
  factory _Order(
      {Restaurant restaurant, Food food, String date, int quantity}) = _$_Order;

  @override
  Restaurant get restaurant;
  @override
  Food get food;
  @override
  String get date;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$OrderCopyWith<_Order> get copyWith;
}
