// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fruit _$_$_FruitFromJson(Map<String, dynamic> json) {
  return _$_Fruit(
    id: json['id'] as String,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    gram: json['gram'] as String,
    fruitQty: json['fruitQty'] as int,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$_$_FruitToJson(_$_Fruit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'gram': instance.gram,
      'fruitQty': instance.fruitQty,
      'image': instance.image,
    };
