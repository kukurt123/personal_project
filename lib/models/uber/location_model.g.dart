// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$_$_LocationModelFromJson(Map<String, dynamic> json) {
  return _$_LocationModel(
    id: json['id'] as String,
    locName: json['locName'] as String,
    info: json['info'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
    locDate: json['locDate'] == null
        ? null
        : DateTime.parse(json['locDate'] as String),
    type: json['type'] as int,
    imageName: json['imageName'] as String,
  );
}

Map<String, dynamic> _$_$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locName': instance.locName,
      'info': instance.info,
      'lat': instance.lat,
      'long': instance.long,
      'locDate': instance.locDate?.toIso8601String(),
      'type': instance.type,
      'imageName': instance.imageName,
    };
