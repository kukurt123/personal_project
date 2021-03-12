import 'package:new_practice/models/social_media/socialpost.dart';
import 'package:new_practice/models/social_media/socialuser.dart';

final _post0 = SocialPost(
  imageUrl: 'assets/images/post0.jpg',
  author: SocialUser(),
  title: 'Post 0',
  location: 'Location 0',
  likes: 102,
  comments: 37,
);
final _post1 = SocialPost(
  imageUrl: 'assets/images/post1.jpg',
  author: SocialUser(),
  title: 'Post 1',
  location: 'Location 1',
  likes: 532,
  comments: 129,
);
final _post2 = SocialPost(
  imageUrl: 'assets/images/post2.jpg',
  author: SocialUser(),
  title: 'Post 2',
  location: 'Location 2',
  likes: 985,
  comments: 213,
);
final _post3 = SocialPost(
  imageUrl: 'assets/images/post3.jpg',
  author: SocialUser(),
  title: 'Post 3',
  location: 'Location 3',
  likes: 402,
  comments: 25,
);
final _post4 = SocialPost(
  imageUrl: 'assets/images/post4.jpg',
  author: SocialUser(),
  title: 'Post 4',
  location: 'Location 4',
  likes: 628,
  comments: 74,
);
final _post5 = SocialPost(
  imageUrl: 'assets/images/post5.jpg',
  author: SocialUser(),
  title: 'Post 5',
  location: 'Location 5',
  likes: 299,
  comments: 28,
);

final posts = [_post0, _post1, _post2, _post3, _post4, _post5];
final users = [
  SocialUser(profileImageUrl: 'assets/images/user0.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user1.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user2.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user3.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user4.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user5.jpg', name: 'Janny'),
  SocialUser(profileImageUrl: 'assets/images/user6.jpg', name: 'Janny'),
];
final _yourPosts = [_post1, _post3, _post5];
final _yourFavorites = [_post0, _post2, _post4];

// Current User
final SocialUser currentUser = SocialUser(
  profileImageUrl: 'assets/images/user0.jpg',
  backgroundImageUrl: 'assets/images/post0.jpg',
  name: 'Rebecca',
  following: 453,
  followers: 937,
  posts: _yourPosts,
  favorites: _yourFavorites,
);

final SocialUser currentUser2 = SocialUser(
  profileImageUrl: 'assets/images/user1.jpg',
  backgroundImageUrl: 'assets/images/post1.jpg',
  name: 'Kurt Ruzelll Estacion',
  following: 2000,
  followers: 23498,
  posts: [
    _post5,
    _post4,
    _post3,
    _post2,
  ],
  favorites: [_post1, _post0],
);
