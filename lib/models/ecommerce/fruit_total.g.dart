// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FruitTotal _$_$_FruitTotalFromJson(Map<String, dynamic> json) {
  return _$_FruitTotal(
    totalId: json['totalId'] as String,
    totalName: json['totalName'] as String,
    totalPrice: (json['totalPrice'] as num)?.toDouble(),
    qty: json['qty'] as int,
    imageLocation: json['imageLocation'] as String,
  );
}

Map<String, dynamic> _$_$_FruitTotalToJson(_$_FruitTotal instance) =>
    <String, dynamic>{
      'totalId': instance.totalId,
      'totalName': instance.totalName,
      'totalPrice': instance.totalPrice,
      'qty': instance.qty,
      'imageLocation': instance.imageLocation,
    };
