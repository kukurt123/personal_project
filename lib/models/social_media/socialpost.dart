import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
part 'socialpost.freezed.dart';

@freezed
abstract class SocialPost with _$SocialPost {
  factory SocialPost(
      {String imageUrl,
      SocialUser author,
      String title,
      String location,
      int likes,
      int comments}) = _SocialPost;
}
