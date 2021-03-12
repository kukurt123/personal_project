// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requestqr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestQr _$_$_RequestQrFromJson(Map<String, dynamic> json) {
  return _$_RequestQr(
    id: json['id'] as String,
    name: json['name'] as String,
    request: json['request'] as String,
    payment: json['payment'] as int,
  );
}

Map<String, dynamic> _$_$_RequestQrToJson(_$_RequestQr instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'request': instance.request,
      'payment': instance.payment,
    };
