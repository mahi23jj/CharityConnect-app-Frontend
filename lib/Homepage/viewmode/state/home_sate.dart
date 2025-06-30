import '../../model/content.dart';

abstract class Conetntstate {}

class Contentinital extends Conetntstate{}

class LoadingState extends Conetntstate {}

class LoadcontentState extends Conetntstate {
 final List<Content> date;
  LoadcontentState({required this.date});
}

class ErrorState extends Conetntstate{
  String message;
  ErrorState({required this.message});
}

class LikeState extends Conetntstate{
  final bool like;
  LikeState({required this.like});
}

class FollowState extends Conetntstate{
  final bool Follow;
  FollowState({required this.Follow});
}

