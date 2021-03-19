// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
class _$HistoryModelTearOff {
  const _$HistoryModelTearOff();

// ignore: unused_element
  _HistoryModel call({@HiveField(0) String placeName}) {
    return _HistoryModel(
      placeName: placeName,
    );
  }

// ignore: unused_element
  HistoryModel fromJson(Map<String, Object> json) {
    return HistoryModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HistoryModel = _$HistoryModelTearOff();

/// @nodoc
mixin _$HistoryModel {
  @HiveField(0)
  String get placeName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String placeName});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object placeName = freezed,
  }) {
    return _then(_value.copyWith(
      placeName: placeName == freezed ? _value.placeName : placeName as String,
    ));
  }
}

/// @nodoc
abstract class _$HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$HistoryModelCopyWith(
          _HistoryModel value, $Res Function(_HistoryModel) then) =
      __$HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String placeName});
}

/// @nodoc
class __$HistoryModelCopyWithImpl<$Res> extends _$HistoryModelCopyWithImpl<$Res>
    implements _$HistoryModelCopyWith<$Res> {
  __$HistoryModelCopyWithImpl(
      _HistoryModel _value, $Res Function(_HistoryModel) _then)
      : super(_value, (v) => _then(v as _HistoryModel));

  @override
  _HistoryModel get _value => super._value as _HistoryModel;

  @override
  $Res call({
    Object placeName = freezed,
  }) {
    return _then(_HistoryModel(
      placeName: placeName == freezed ? _value.placeName : placeName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HistoryModel implements _HistoryModel {
  _$_HistoryModel({@HiveField(0) this.placeName});

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_HistoryModelFromJson(json);

  @override
  @HiveField(0)
  final String placeName;

  @override
  String toString() {
    return 'HistoryModel(placeName: $placeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HistoryModel &&
            (identical(other.placeName, placeName) ||
                const DeepCollectionEquality()
                    .equals(other.placeName, placeName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(placeName);

  @JsonKey(ignore: true)
  @override
  _$HistoryModelCopyWith<_HistoryModel> get copyWith =>
      __$HistoryModelCopyWithImpl<_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HistoryModelToJson(this);
  }
}

abstract class _HistoryModel implements HistoryModel {
  factory _HistoryModel({@HiveField(0) String placeName}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  @HiveField(0)
  String get placeName;
  @override
  @JsonKey(ignore: true)
  _$HistoryModelCopyWith<_HistoryModel> get copyWith;
}
