import 'package:flutter/foundation.dart';
import 'package:travel/Homepage/model/comment.dart';

class Content {
  String id;
  String username;
  String profile;
  String discription;
  String post;
  List<Comments> comments =[];

  Content(
      {required this.id,
      required this.post,
      required this.discription,
      required this.profile,
      required this.username,
      });

  factory Content.frommap(Map<String, dynamic> json) {
    return Content(
        id: json['id'],
        post: json['post'],
        discription: json['discription'],
        profile: json['profile'],
        username: json['username'],
        
        
        );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'post': post,
      'discription': discription,
      'profile': profile,
      'username': username
    };
  }
}
