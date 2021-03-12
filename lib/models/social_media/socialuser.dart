import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_practice/models/social_media/socialpost.dart';
part 'socialuser.freezed.dart';

@freezed
abstract class SocialUser with _$SocialUser {
  factory SocialUser(
      {String profileImageUrl,
      String backgroundImageUrl,
      String name,
      int following,
      int followers,
      List<SocialPost> posts,
      List<SocialPost> favorites}) = _SocialUser;
}
