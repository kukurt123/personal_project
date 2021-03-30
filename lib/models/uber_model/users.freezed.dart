// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
class _$UsersTearOff {
  const _$UsersTearOff();

// ignore: unused_element
  _Users call({String uid, String photoUrl, String displayName}) {
    return _Users(
      uid: uid,
      photoUrl: photoUrl,
      displayName: displayName,
    );
  }

// ignore: unused_element
  Users fromJson(Map<String, Object> json) {
    return Users.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Users = _$UsersTearOff();

/// @nodoc
mixin _$Users {
  String get uid;
  String get photoUrl;
  String get displayName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res>;
  $Res call({String uid, String photoUrl, String displayName});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res> implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  final Users _value;
  // ignore: unused_field
  final $Res Function(Users) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object photoUrl = freezed,
    Object displayName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
    ));
  }
}

/// @nodoc
abstract class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) then) =
      __$UsersCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String photoUrl, String displayName});
}

/// @nodoc
class __$UsersCopyWithImpl<$Res> extends _$UsersCopyWithImpl<$Res>
    implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(_Users _value, $Res Function(_Users) _then)
      : super(_value, (v) => _then(v as _Users));

  @override
  _Users get _value => super._value as _Users;

  @override
  $Res call({
    Object uid = freezed,
    Object photoUrl = freezed,
    Object displayName = freezed,
  }) {
    return _then(_Users(
      uid: uid == freezed ? _value.uid : uid as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Users implements _Users {
  _$_Users({this.uid, this.photoUrl, this.displayName});

  factory _$_Users.fromJson(Map<String, dynamic> json) =>
      _$_$_UsersFromJson(json);

  @override
  final String uid;
  @override
  final String photoUrl;
  @override
  final String displayName;

  @override
  String toString() {
    return 'Users(uid: $uid, photoUrl: $photoUrl, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Users &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(displayName);

  @JsonKey(ignore: true)
  @override
  _$UsersCopyWith<_Users> get copyWith =>
      __$UsersCopyWithImpl<_Users>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UsersToJson(this);
  }
}

abstract class _Users implements Users {
  factory _Users({String uid, String photoUrl, String displayName}) = _$_Users;

  factory _Users.fromJson(Map<String, dynamic> json) = _$_Users.fromJson;

  @override
  String get uid;
  @override
  String get photoUrl;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$UsersCopyWith<_Users> get copyWith;
}
