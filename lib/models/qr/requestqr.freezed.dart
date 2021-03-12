// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'requestqr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestQr _$RequestQrFromJson(Map<String, dynamic> json) {
  return _RequestQr.fromJson(json);
}

/// @nodoc
class _$RequestQrTearOff {
  const _$RequestQrTearOff();

// ignore: unused_element
  _RequestQr call({String id, String name, String request, int payment}) {
    return _RequestQr(
      id: id,
      name: name,
      request: request,
      payment: payment,
    );
  }

// ignore: unused_element
  RequestQr fromJson(Map<String, Object> json) {
    return RequestQr.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestQr = _$RequestQrTearOff();

/// @nodoc
mixin _$RequestQr {
  String get id;
  String get name;
  String get request;
  int get payment;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RequestQrCopyWith<RequestQr> get copyWith;
}

/// @nodoc
abstract class $RequestQrCopyWith<$Res> {
  factory $RequestQrCopyWith(RequestQr value, $Res Function(RequestQr) then) =
      _$RequestQrCopyWithImpl<$Res>;
  $Res call({String id, String name, String request, int payment});
}

/// @nodoc
class _$RequestQrCopyWithImpl<$Res> implements $RequestQrCopyWith<$Res> {
  _$RequestQrCopyWithImpl(this._value, this._then);

  final RequestQr _value;
  // ignore: unused_field
  final $Res Function(RequestQr) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object request = freezed,
    Object payment = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      request: request == freezed ? _value.request : request as String,
      payment: payment == freezed ? _value.payment : payment as int,
    ));
  }
}

/// @nodoc
abstract class _$RequestQrCopyWith<$Res> implements $RequestQrCopyWith<$Res> {
  factory _$RequestQrCopyWith(
          _RequestQr value, $Res Function(_RequestQr) then) =
      __$RequestQrCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String request, int payment});
}

/// @nodoc
class __$RequestQrCopyWithImpl<$Res> extends _$RequestQrCopyWithImpl<$Res>
    implements _$RequestQrCopyWith<$Res> {
  __$RequestQrCopyWithImpl(_RequestQr _value, $Res Function(_RequestQr) _then)
      : super(_value, (v) => _then(v as _RequestQr));

  @override
  _RequestQr get _value => super._value as _RequestQr;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object request = freezed,
    Object payment = freezed,
  }) {
    return _then(_RequestQr(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      request: request == freezed ? _value.request : request as String,
      payment: payment == freezed ? _value.payment : payment as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestQr implements _RequestQr {
  _$_RequestQr({this.id, this.name, this.request, this.payment});

  factory _$_RequestQr.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestQrFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String request;
  @override
  final int payment;

  @override
  String toString() {
    return 'RequestQr(id: $id, name: $name, request: $request, payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestQr &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality()
                    .equals(other.request, request)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality().equals(other.payment, payment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(payment);

  @JsonKey(ignore: true)
  @override
  _$RequestQrCopyWith<_RequestQr> get copyWith =>
      __$RequestQrCopyWithImpl<_RequestQr>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestQrToJson(this);
  }
}

abstract class _RequestQr implements RequestQr {
  factory _RequestQr({String id, String name, String request, int payment}) =
      _$_RequestQr;

  factory _RequestQr.fromJson(Map<String, dynamic> json) =
      _$_RequestQr.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get request;
  @override
  int get payment;
  @override
  @JsonKey(ignore: true)
  _$RequestQrCopyWith<_RequestQr> get copyWith;
}
