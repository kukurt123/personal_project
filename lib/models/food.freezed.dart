// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FoodTearOff {
  const _$FoodTearOff();

// ignore: unused_element
  _Food call({String imageUrl, String name, double price}) {
    return _Food(
      imageUrl: imageUrl,
      name: name,
      price: price,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Food = _$FoodTearOff();

/// @nodoc
mixin _$Food {
  String get imageUrl;
  String get name;
  double get price;

  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call({String imageUrl, String name, double price});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object name = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
    ));
  }
}

/// @nodoc
abstract class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) then) =
      __$FoodCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl, String name, double price});
}

/// @nodoc
class __$FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(_Food _value, $Res Function(_Food) _then)
      : super(_value, (v) => _then(v as _Food));

  @override
  _Food get _value => super._value as _Food;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object name = freezed,
    Object price = freezed,
  }) {
    return _then(_Food(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
    ));
  }
}

/// @nodoc
class _$_Food implements _Food {
  _$_Food({this.imageUrl, this.name, this.price});

  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'Food(imageUrl: $imageUrl, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Food &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);
}

abstract class _Food implements Food {
  factory _Food({String imageUrl, String name, double price}) = _$_Food;

  @override
  String get imageUrl;
  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$FoodCopyWith<_Food> get copyWith;
}
