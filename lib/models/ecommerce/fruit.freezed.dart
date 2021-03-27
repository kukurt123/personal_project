// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'fruit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Fruit _$FruitFromJson(Map<String, dynamic> json) {
  return _Fruit.fromJson(json);
}

/// @nodoc
class _$FruitTearOff {
  const _$FruitTearOff();

// ignore: unused_element
  _Fruit call(
      {String id,
      String name,
      double price,
      String gram,
      int fruitQty,
      String image}) {
    return _Fruit(
      id: id,
      name: name,
      price: price,
      gram: gram,
      fruitQty: fruitQty,
      image: image,
    );
  }

// ignore: unused_element
  Fruit fromJson(Map<String, Object> json) {
    return Fruit.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Fruit = _$FruitTearOff();

/// @nodoc
mixin _$Fruit {
  String get id;
  String get name;
  double get price;
  String get gram;
  int get fruitQty;
  String get image;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $FruitCopyWith<Fruit> get copyWith;
}

/// @nodoc
abstract class $FruitCopyWith<$Res> {
  factory $FruitCopyWith(Fruit value, $Res Function(Fruit) then) =
      _$FruitCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      double price,
      String gram,
      int fruitQty,
      String image});
}

/// @nodoc
class _$FruitCopyWithImpl<$Res> implements $FruitCopyWith<$Res> {
  _$FruitCopyWithImpl(this._value, this._then);

  final Fruit _value;
  // ignore: unused_field
  final $Res Function(Fruit) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object gram = freezed,
    Object fruitQty = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      gram: gram == freezed ? _value.gram : gram as String,
      fruitQty: fruitQty == freezed ? _value.fruitQty : fruitQty as int,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
abstract class _$FruitCopyWith<$Res> implements $FruitCopyWith<$Res> {
  factory _$FruitCopyWith(_Fruit value, $Res Function(_Fruit) then) =
      __$FruitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      double price,
      String gram,
      int fruitQty,
      String image});
}

/// @nodoc
class __$FruitCopyWithImpl<$Res> extends _$FruitCopyWithImpl<$Res>
    implements _$FruitCopyWith<$Res> {
  __$FruitCopyWithImpl(_Fruit _value, $Res Function(_Fruit) _then)
      : super(_value, (v) => _then(v as _Fruit));

  @override
  _Fruit get _value => super._value as _Fruit;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object gram = freezed,
    Object fruitQty = freezed,
    Object image = freezed,
  }) {
    return _then(_Fruit(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      gram: gram == freezed ? _value.gram : gram as String,
      fruitQty: fruitQty == freezed ? _value.fruitQty : fruitQty as int,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Fruit implements _Fruit {
  _$_Fruit(
      {this.id, this.name, this.price, this.gram, this.fruitQty, this.image});

  factory _$_Fruit.fromJson(Map<String, dynamic> json) =>
      _$_$_FruitFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String gram;
  @override
  final int fruitQty;
  @override
  final String image;

  @override
  String toString() {
    return 'Fruit(id: $id, name: $name, price: $price, gram: $gram, fruitQty: $fruitQty, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fruit &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.gram, gram) ||
                const DeepCollectionEquality().equals(other.gram, gram)) &&
            (identical(other.fruitQty, fruitQty) ||
                const DeepCollectionEquality()
                    .equals(other.fruitQty, fruitQty)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(gram) ^
      const DeepCollectionEquality().hash(fruitQty) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$FruitCopyWith<_Fruit> get copyWith =>
      __$FruitCopyWithImpl<_Fruit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FruitToJson(this);
  }
}

abstract class _Fruit implements Fruit {
  factory _Fruit(
      {String id,
      String name,
      double price,
      String gram,
      int fruitQty,
      String image}) = _$_Fruit;

  factory _Fruit.fromJson(Map<String, dynamic> json) = _$_Fruit.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String get gram;
  @override
  int get fruitQty;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$FruitCopyWith<_Fruit> get copyWith;
}
