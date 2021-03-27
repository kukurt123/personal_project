// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'fruit_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FruitTotal _$FruitTotalFromJson(Map<String, dynamic> json) {
  return _FruitTotal.fromJson(json);
}

/// @nodoc
class _$FruitTotalTearOff {
  const _$FruitTotalTearOff();

// ignore: unused_element
  _FruitTotal call(
      {String totalId,
      String totalName,
      double totalPrice,
      int qty,
      String imageLocation}) {
    return _FruitTotal(
      totalId: totalId,
      totalName: totalName,
      totalPrice: totalPrice,
      qty: qty,
      imageLocation: imageLocation,
    );
  }

// ignore: unused_element
  FruitTotal fromJson(Map<String, Object> json) {
    return FruitTotal.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FruitTotal = _$FruitTotalTearOff();

/// @nodoc
mixin _$FruitTotal {
  String get totalId;
  String get totalName;
  double get totalPrice;
  int get qty;
  String get imageLocation;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $FruitTotalCopyWith<FruitTotal> get copyWith;
}

/// @nodoc
abstract class $FruitTotalCopyWith<$Res> {
  factory $FruitTotalCopyWith(
          FruitTotal value, $Res Function(FruitTotal) then) =
      _$FruitTotalCopyWithImpl<$Res>;
  $Res call(
      {String totalId,
      String totalName,
      double totalPrice,
      int qty,
      String imageLocation});
}

/// @nodoc
class _$FruitTotalCopyWithImpl<$Res> implements $FruitTotalCopyWith<$Res> {
  _$FruitTotalCopyWithImpl(this._value, this._then);

  final FruitTotal _value;
  // ignore: unused_field
  final $Res Function(FruitTotal) _then;

  @override
  $Res call({
    Object totalId = freezed,
    Object totalName = freezed,
    Object totalPrice = freezed,
    Object qty = freezed,
    Object imageLocation = freezed,
  }) {
    return _then(_value.copyWith(
      totalId: totalId == freezed ? _value.totalId : totalId as String,
      totalName: totalName == freezed ? _value.totalName : totalName as String,
      totalPrice:
          totalPrice == freezed ? _value.totalPrice : totalPrice as double,
      qty: qty == freezed ? _value.qty : qty as int,
      imageLocation: imageLocation == freezed
          ? _value.imageLocation
          : imageLocation as String,
    ));
  }
}

/// @nodoc
abstract class _$FruitTotalCopyWith<$Res> implements $FruitTotalCopyWith<$Res> {
  factory _$FruitTotalCopyWith(
          _FruitTotal value, $Res Function(_FruitTotal) then) =
      __$FruitTotalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String totalId,
      String totalName,
      double totalPrice,
      int qty,
      String imageLocation});
}

/// @nodoc
class __$FruitTotalCopyWithImpl<$Res> extends _$FruitTotalCopyWithImpl<$Res>
    implements _$FruitTotalCopyWith<$Res> {
  __$FruitTotalCopyWithImpl(
      _FruitTotal _value, $Res Function(_FruitTotal) _then)
      : super(_value, (v) => _then(v as _FruitTotal));

  @override
  _FruitTotal get _value => super._value as _FruitTotal;

  @override
  $Res call({
    Object totalId = freezed,
    Object totalName = freezed,
    Object totalPrice = freezed,
    Object qty = freezed,
    Object imageLocation = freezed,
  }) {
    return _then(_FruitTotal(
      totalId: totalId == freezed ? _value.totalId : totalId as String,
      totalName: totalName == freezed ? _value.totalName : totalName as String,
      totalPrice:
          totalPrice == freezed ? _value.totalPrice : totalPrice as double,
      qty: qty == freezed ? _value.qty : qty as int,
      imageLocation: imageLocation == freezed
          ? _value.imageLocation
          : imageLocation as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FruitTotal implements _FruitTotal {
  _$_FruitTotal(
      {this.totalId,
      this.totalName,
      this.totalPrice,
      this.qty,
      this.imageLocation});

  factory _$_FruitTotal.fromJson(Map<String, dynamic> json) =>
      _$_$_FruitTotalFromJson(json);

  @override
  final String totalId;
  @override
  final String totalName;
  @override
  final double totalPrice;
  @override
  final int qty;
  @override
  final String imageLocation;

  @override
  String toString() {
    return 'FruitTotal(totalId: $totalId, totalName: $totalName, totalPrice: $totalPrice, qty: $qty, imageLocation: $imageLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FruitTotal &&
            (identical(other.totalId, totalId) ||
                const DeepCollectionEquality()
                    .equals(other.totalId, totalId)) &&
            (identical(other.totalName, totalName) ||
                const DeepCollectionEquality()
                    .equals(other.totalName, totalName)) &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.qty, qty) ||
                const DeepCollectionEquality().equals(other.qty, qty)) &&
            (identical(other.imageLocation, imageLocation) ||
                const DeepCollectionEquality()
                    .equals(other.imageLocation, imageLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalId) ^
      const DeepCollectionEquality().hash(totalName) ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(qty) ^
      const DeepCollectionEquality().hash(imageLocation);

  @JsonKey(ignore: true)
  @override
  _$FruitTotalCopyWith<_FruitTotal> get copyWith =>
      __$FruitTotalCopyWithImpl<_FruitTotal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FruitTotalToJson(this);
  }
}

abstract class _FruitTotal implements FruitTotal {
  factory _FruitTotal(
      {String totalId,
      String totalName,
      double totalPrice,
      int qty,
      String imageLocation}) = _$_FruitTotal;

  factory _FruitTotal.fromJson(Map<String, dynamic> json) =
      _$_FruitTotal.fromJson;

  @override
  String get totalId;
  @override
  String get totalName;
  @override
  double get totalPrice;
  @override
  int get qty;
  @override
  String get imageLocation;
  @override
  @JsonKey(ignore: true)
  _$FruitTotalCopyWith<_FruitTotal> get copyWith;
}
