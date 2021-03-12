// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RestaurantTearOff {
  const _$RestaurantTearOff();

// ignore: unused_element
  _Restaurant call(
      {String imageUrl,
      String name,
      String address,
      int rating,
      List<Food> menu}) {
    return _Restaurant(
      imageUrl: imageUrl,
      name: name,
      address: address,
      rating: rating,
      menu: menu,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Restaurant = _$RestaurantTearOff();

/// @nodoc
mixin _$Restaurant {
  String get imageUrl;
  String get name;
  String get address;
  int get rating;
  List<Food> get menu;

  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call(
      {String imageUrl,
      String name,
      String address,
      int rating,
      List<Food> menu});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object name = freezed,
    Object address = freezed,
    Object rating = freezed,
    Object menu = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      rating: rating == freezed ? _value.rating : rating as int,
      menu: menu == freezed ? _value.menu : menu as List<Food>,
    ));
  }
}

/// @nodoc
abstract class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(
          _Restaurant value, $Res Function(_Restaurant) then) =
      __$RestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imageUrl,
      String name,
      String address,
      int rating,
      List<Food> menu});
}

/// @nodoc
class __$RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(
      _Restaurant _value, $Res Function(_Restaurant) _then)
      : super(_value, (v) => _then(v as _Restaurant));

  @override
  _Restaurant get _value => super._value as _Restaurant;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object name = freezed,
    Object address = freezed,
    Object rating = freezed,
    Object menu = freezed,
  }) {
    return _then(_Restaurant(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      rating: rating == freezed ? _value.rating : rating as int,
      menu: menu == freezed ? _value.menu : menu as List<Food>,
    ));
  }
}

/// @nodoc
class _$_Restaurant implements _Restaurant {
  _$_Restaurant(
      {this.imageUrl, this.name, this.address, this.rating, this.menu});

  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final String address;
  @override
  final int rating;
  @override
  final List<Food> menu;

  @override
  String toString() {
    return 'Restaurant(imageUrl: $imageUrl, name: $name, address: $address, rating: $rating, menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Restaurant &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(menu);

  @JsonKey(ignore: true)
  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {String imageUrl,
      String name,
      String address,
      int rating,
      List<Food> menu}) = _$_Restaurant;

  @override
  String get imageUrl;
  @override
  String get name;
  @override
  String get address;
  @override
  int get rating;
  @override
  List<Food> get menu;
  @override
  @JsonKey(ignore: true)
  _$RestaurantCopyWith<_Restaurant> get copyWith;
}
