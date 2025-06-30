import 'package:flutter/foundation.dart';
import 'package:travel/Homepage/model/comment.dart';

class Content {
  String id;
  String username;
  String profile;
  String discription;
  String post;
  List<String> tags;
  bool isLiked = false;
  int likes = 0;
  bool isFollowed = false;


  Content(
      {
      required this.id,
      required this.post,
      required this.discription,
      required this.profile,
      required this.username,
      required this.tags,
      required this.isLiked,
      required this.likes,
      required this.isFollowed
      });

 factory Content.fromMap(Map<String, dynamic> json) {
  return Content(
    id: json['_id'],
    post: json['image_url'],
    discription: json['discription'],
    profile: json['creator_id']['org_profilepic'],
    username: json['creator_id']['org_name'],
    tags: List<String>.from(json['creator_id']['org_specilalization']),
    isLiked: json['islikedbyuser'] ?? false,
    likes: json['likes'] ?? 0,
    isFollowed: json['follow'] ?? false,
  );
}


  Map<String, dynamic> tojson() {
    return {
      'post': post,
      'discription': discription,
      'profile': profile,
      'username': username
    };
  }

  copyWith({required bool isLikedByUser, required int like}) {}
}
