// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'socialuser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SocialUserTearOff {
  const _$SocialUserTearOff();

// ignore: unused_element
  _SocialUser call(
      {String profileImageUrl,
      String backgroundImageUrl,
      String name,
      int following,
      int followers,
      List<SocialPost> posts,
      List<SocialPost> favorites}) {
    return _SocialUser(
      profileImageUrl: profileImageUrl,
      backgroundImageUrl: backgroundImageUrl,
      name: name,
      following: following,
      followers: followers,
      posts: posts,
      favorites: favorites,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SocialUser = _$SocialUserTearOff();

/// @nodoc
mixin _$SocialUser {
  String get profileImageUrl;
  String get backgroundImageUrl;
  String get name;
  int get following;
  int get followers;
  List<SocialPost> get posts;
  List<SocialPost> get favorites;

  @JsonKey(ignore: true)
  $SocialUserCopyWith<SocialUser> get copyWith;
}

/// @nodoc
abstract class $SocialUserCopyWith<$Res> {
  factory $SocialUserCopyWith(
          SocialUser value, $Res Function(SocialUser) then) =
      _$SocialUserCopyWithImpl<$Res>;
  $Res call(
      {String profileImageUrl,
      String backgroundImageUrl,
      String name,
      int following,
      int followers,
      List<SocialPost> posts,
      List<SocialPost> favorites});
}

/// @nodoc
class _$SocialUserCopyWithImpl<$Res> implements $SocialUserCopyWith<$Res> {
  _$SocialUserCopyWithImpl(this._value, this._then);

  final SocialUser _value;
  // ignore: unused_field
  final $Res Function(SocialUser) _then;

  @override
  $Res call({
    Object profileImageUrl = freezed,
    Object backgroundImageUrl = freezed,
    Object name = freezed,
    Object following = freezed,
    Object followers = freezed,
    Object posts = freezed,
    Object favorites = freezed,
  }) {
    return _then(_value.copyWith(
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl as String,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl as String,
      name: name == freezed ? _value.name : name as String,
      following: following == freezed ? _value.following : following as int,
      followers: followers == freezed ? _value.followers : followers as int,
      posts: posts == freezed ? _value.posts : posts as List<SocialPost>,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites as List<SocialPost>,
    ));
  }
}

/// @nodoc
abstract class _$SocialUserCopyWith<$Res> implements $SocialUserCopyWith<$Res> {
  factory _$SocialUserCopyWith(
          _SocialUser value, $Res Function(_SocialUser) then) =
      __$SocialUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String profileImageUrl,
      String backgroundImageUrl,
      String name,
      int following,
      int followers,
      List<SocialPost> posts,
      List<SocialPost> favorites});
}

/// @nodoc
class __$SocialUserCopyWithImpl<$Res> extends _$SocialUserCopyWithImpl<$Res>
    implements _$SocialUserCopyWith<$Res> {
  __$SocialUserCopyWithImpl(
      _SocialUser _value, $Res Function(_SocialUser) _then)
      : super(_value, (v) => _then(v as _SocialUser));

  @override
  _SocialUser get _value => super._value as _SocialUser;

  @override
  $Res call({
    Object profileImageUrl = freezed,
    Object backgroundImageUrl = freezed,
    Object name = freezed,
    Object following = freezed,
    Object followers = freezed,
    Object posts = freezed,
    Object favorites = freezed,
  }) {
    return _then(_SocialUser(
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl as String,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl as String,
      name: name == freezed ? _value.name : name as String,
      following: following == freezed ? _value.following : following as int,
      followers: followers == freezed ? _value.followers : followers as int,
      posts: posts == freezed ? _value.posts : posts as List<SocialPost>,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites as List<SocialPost>,
    ));
  }
}

/// @nodoc
class _$_SocialUser implements _SocialUser {
  _$_SocialUser(
      {this.profileImageUrl,
      this.backgroundImageUrl,
      this.name,
      this.following,
      this.followers,
      this.posts,
      this.favorites});

  @override
  final String profileImageUrl;
  @override
  final String backgroundImageUrl;
  @override
  final String name;
  @override
  final int following;
  @override
  final int followers;
  @override
  final List<SocialPost> posts;
  @override
  final List<SocialPost> favorites;

  @override
  String toString() {
    return 'SocialUser(profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, name: $name, following: $following, followers: $followers, posts: $posts, favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SocialUser &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profileImageUrl, profileImageUrl)) &&
            (identical(other.backgroundImageUrl, backgroundImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundImageUrl, backgroundImageUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.following, following) ||
                const DeepCollectionEquality()
                    .equals(other.following, following)) &&
            (identical(other.followers, followers) ||
                const DeepCollectionEquality()
                    .equals(other.followers, followers)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.favorites, favorites) ||
                const DeepCollectionEquality()
                    .equals(other.favorites, favorites)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profileImageUrl) ^
      const DeepCollectionEquality().hash(backgroundImageUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(following) ^
      const DeepCollectionEquality().hash(followers) ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(favorites);

  @JsonKey(ignore: true)
  @override
  _$SocialUserCopyWith<_SocialUser> get copyWith =>
      __$SocialUserCopyWithImpl<_SocialUser>(this, _$identity);
}

abstract class _SocialUser implements SocialUser {
  factory _SocialUser(
      {String profileImageUrl,
      String backgroundImageUrl,
      String name,
      int following,
      int followers,
      List<SocialPost> posts,
      List<SocialPost> favorites}) = _$_SocialUser;

  @override
  String get profileImageUrl;
  @override
  String get backgroundImageUrl;
  @override
  String get name;
  @override
  int get following;
  @override
  int get followers;
  @override
  List<SocialPost> get posts;
  @override
  List<SocialPost> get favorites;
  @override
  @JsonKey(ignore: true)
  _$SocialUserCopyWith<_SocialUser> get copyWith;
}
