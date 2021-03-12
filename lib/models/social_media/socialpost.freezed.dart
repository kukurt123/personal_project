// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'socialpost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SocialPostTearOff {
  const _$SocialPostTearOff();

// ignore: unused_element
  _SocialPost call(
      {String imageUrl,
      SocialUser author,
      String title,
      String location,
      int likes,
      int comments}) {
    return _SocialPost(
      imageUrl: imageUrl,
      author: author,
      title: title,
      location: location,
      likes: likes,
      comments: comments,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SocialPost = _$SocialPostTearOff();

/// @nodoc
mixin _$SocialPost {
  String get imageUrl;
  SocialUser get author;
  String get title;
  String get location;
  int get likes;
  int get comments;

  @JsonKey(ignore: true)
  $SocialPostCopyWith<SocialPost> get copyWith;
}

/// @nodoc
abstract class $SocialPostCopyWith<$Res> {
  factory $SocialPostCopyWith(
          SocialPost value, $Res Function(SocialPost) then) =
      _$SocialPostCopyWithImpl<$Res>;
  $Res call(
      {String imageUrl,
      SocialUser author,
      String title,
      String location,
      int likes,
      int comments});

  $SocialUserCopyWith<$Res> get author;
}

/// @nodoc
class _$SocialPostCopyWithImpl<$Res> implements $SocialPostCopyWith<$Res> {
  _$SocialPostCopyWithImpl(this._value, this._then);

  final SocialPost _value;
  // ignore: unused_field
  final $Res Function(SocialPost) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object author = freezed,
    Object title = freezed,
    Object location = freezed,
    Object likes = freezed,
    Object comments = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      author: author == freezed ? _value.author : author as SocialUser,
      title: title == freezed ? _value.title : title as String,
      location: location == freezed ? _value.location : location as String,
      likes: likes == freezed ? _value.likes : likes as int,
      comments: comments == freezed ? _value.comments : comments as int,
    ));
  }

  @override
  $SocialUserCopyWith<$Res> get author {
    if (_value.author == null) {
      return null;
    }
    return $SocialUserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$SocialPostCopyWith<$Res> implements $SocialPostCopyWith<$Res> {
  factory _$SocialPostCopyWith(
          _SocialPost value, $Res Function(_SocialPost) then) =
      __$SocialPostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imageUrl,
      SocialUser author,
      String title,
      String location,
      int likes,
      int comments});

  @override
  $SocialUserCopyWith<$Res> get author;
}

/// @nodoc
class __$SocialPostCopyWithImpl<$Res> extends _$SocialPostCopyWithImpl<$Res>
    implements _$SocialPostCopyWith<$Res> {
  __$SocialPostCopyWithImpl(
      _SocialPost _value, $Res Function(_SocialPost) _then)
      : super(_value, (v) => _then(v as _SocialPost));

  @override
  _SocialPost get _value => super._value as _SocialPost;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object author = freezed,
    Object title = freezed,
    Object location = freezed,
    Object likes = freezed,
    Object comments = freezed,
  }) {
    return _then(_SocialPost(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      author: author == freezed ? _value.author : author as SocialUser,
      title: title == freezed ? _value.title : title as String,
      location: location == freezed ? _value.location : location as String,
      likes: likes == freezed ? _value.likes : likes as int,
      comments: comments == freezed ? _value.comments : comments as int,
    ));
  }
}

/// @nodoc
class _$_SocialPost implements _SocialPost {
  _$_SocialPost(
      {this.imageUrl,
      this.author,
      this.title,
      this.location,
      this.likes,
      this.comments});

  @override
  final String imageUrl;
  @override
  final SocialUser author;
  @override
  final String title;
  @override
  final String location;
  @override
  final int likes;
  @override
  final int comments;

  @override
  String toString() {
    return 'SocialPost(imageUrl: $imageUrl, author: $author, title: $title, location: $location, likes: $likes, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SocialPost &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  _$SocialPostCopyWith<_SocialPost> get copyWith =>
      __$SocialPostCopyWithImpl<_SocialPost>(this, _$identity);
}

abstract class _SocialPost implements SocialPost {
  factory _SocialPost(
      {String imageUrl,
      SocialUser author,
      String title,
      String location,
      int likes,
      int comments}) = _$_SocialPost;

  @override
  String get imageUrl;
  @override
  SocialUser get author;
  @override
  String get title;
  @override
  String get location;
  @override
  int get likes;
  @override
  int get comments;
  @override
  @JsonKey(ignore: true)
  _$SocialPostCopyWith<_SocialPost> get copyWith;
}
