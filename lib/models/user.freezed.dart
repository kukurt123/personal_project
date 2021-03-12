// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call({String name, List<Order> orders, List<Order> cart}) {
    return _User(
      name: name,
      orders: orders,
      cart: cart,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get name;
  List<Order> get orders;
  List<Order> get cart;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String name, List<Order> orders, List<Order> cart});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object name = freezed,
    Object orders = freezed,
    Object cart = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      orders: orders == freezed ? _value.orders : orders as List<Order>,
      cart: cart == freezed ? _value.cart : cart as List<Order>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Order> orders, List<Order> cart});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object name = freezed,
    Object orders = freezed,
    Object cart = freezed,
  }) {
    return _then(_User(
      name: name == freezed ? _value.name : name as String,
      orders: orders == freezed ? _value.orders : orders as List<Order>,
      cart: cart == freezed ? _value.cart : cart as List<Order>,
    ));
  }
}

/// @nodoc
class _$_User implements _User {
  _$_User({this.name, this.orders, this.cart});

  @override
  final String name;
  @override
  final List<Order> orders;
  @override
  final List<Order> cart;

  @override
  String toString() {
    return 'User(name: $name, orders: $orders, cart: $cart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.orders, orders) ||
                const DeepCollectionEquality().equals(other.orders, orders)) &&
            (identical(other.cart, cart) ||
                const DeepCollectionEquality().equals(other.cart, cart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(orders) ^
      const DeepCollectionEquality().hash(cart);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  factory _User({String name, List<Order> orders, List<Order> cart}) = _$_User;

  @override
  String get name;
  @override
  List<Order> get orders;
  @override
  List<Order> get cart;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
