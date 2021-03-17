// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
class _$LocationModelTearOff {
  const _$LocationModelTearOff();

// ignore: unused_element
  _LocationModel call(
      {String id,
      String locName,
      String info,
      double lat,
      double long,
      DateTime locDate,
      int type,
      String imageName}) {
    return _LocationModel(
      id: id,
      locName: locName,
      info: info,
      lat: lat,
      long: long,
      locDate: locDate,
      type: type,
      imageName: imageName,
    );
  }

// ignore: unused_element
  LocationModel fromJson(Map<String, Object> json) {
    return LocationModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LocationModel = _$LocationModelTearOff();

/// @nodoc
mixin _$LocationModel {
  String get id;
  String get locName;
  String get info;
  double get lat;
  double get long;
  DateTime get locDate;
  int get type;
  String get imageName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String locName,
      String info,
      double lat,
      double long,
      DateTime locDate,
      int type,
      String imageName});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  final LocationModel _value;
  // ignore: unused_field
  final $Res Function(LocationModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object locName = freezed,
    Object info = freezed,
    Object lat = freezed,
    Object long = freezed,
    Object locDate = freezed,
    Object type = freezed,
    Object imageName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      locName: locName == freezed ? _value.locName : locName as String,
      info: info == freezed ? _value.info : info as String,
      lat: lat == freezed ? _value.lat : lat as double,
      long: long == freezed ? _value.long : long as double,
      locDate: locDate == freezed ? _value.locDate : locDate as DateTime,
      type: type == freezed ? _value.type : type as int,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
    ));
  }
}

/// @nodoc
abstract class _$LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(
          _LocationModel value, $Res Function(_LocationModel) then) =
      __$LocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String locName,
      String info,
      double lat,
      double long,
      DateTime locDate,
      int type,
      String imageName});
}

/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(
      _LocationModel _value, $Res Function(_LocationModel) _then)
      : super(_value, (v) => _then(v as _LocationModel));

  @override
  _LocationModel get _value => super._value as _LocationModel;

  @override
  $Res call({
    Object id = freezed,
    Object locName = freezed,
    Object info = freezed,
    Object lat = freezed,
    Object long = freezed,
    Object locDate = freezed,
    Object type = freezed,
    Object imageName = freezed,
  }) {
    return _then(_LocationModel(
      id: id == freezed ? _value.id : id as String,
      locName: locName == freezed ? _value.locName : locName as String,
      info: info == freezed ? _value.info : info as String,
      lat: lat == freezed ? _value.lat : lat as double,
      long: long == freezed ? _value.long : long as double,
      locDate: locDate == freezed ? _value.locDate : locDate as DateTime,
      type: type == freezed ? _value.type : type as int,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LocationModel implements _LocationModel {
  _$_LocationModel(
      {this.id,
      this.locName,
      this.info,
      this.lat,
      this.long,
      this.locDate,
      this.type,
      this.imageName});

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationModelFromJson(json);

  @override
  final String id;
  @override
  final String locName;
  @override
  final String info;
  @override
  final double lat;
  @override
  final double long;
  @override
  final DateTime locDate;
  @override
  final int type;
  @override
  final String imageName;

  @override
  String toString() {
    return 'LocationModel(id: $id, locName: $locName, info: $info, lat: $lat, long: $long, locDate: $locDate, type: $type, imageName: $imageName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.locName, locName) ||
                const DeepCollectionEquality()
                    .equals(other.locName, locName)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.long, long) ||
                const DeepCollectionEquality().equals(other.long, long)) &&
            (identical(other.locDate, locDate) ||
                const DeepCollectionEquality()
                    .equals(other.locDate, locDate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.imageName, imageName) ||
                const DeepCollectionEquality()
                    .equals(other.imageName, imageName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(locName) ^
      const DeepCollectionEquality().hash(info) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(long) ^
      const DeepCollectionEquality().hash(locDate) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(imageName);

  @JsonKey(ignore: true)
  @override
  _$LocationModelCopyWith<_LocationModel> get copyWith =>
      __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationModelToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel(
      {String id,
      String locName,
      String info,
      double lat,
      double long,
      DateTime locDate,
      int type,
      String imageName}) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  String get id;
  @override
  String get locName;
  @override
  String get info;
  @override
  double get lat;
  @override
  double get long;
  @override
  DateTime get locDate;
  @override
  int get type;
  @override
  String get imageName;
  @override
  @JsonKey(ignore: true)
  _$LocationModelCopyWith<_LocationModel> get copyWith;
}
