import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Homepage/model/comment.dart';
import 'package:travel/autentication/Login/logindata.dart';

class CommentProvider extends Cubit<Comments?> {
  CommentProvider() : super(null);

  void post_comment({required user users, required String comment}) {
    emit(Comments(Comment: comment, users: users, time: DateTime.now()));
  }

  void comment_replay(Comments maincomment, user users, String comment) {
    maincomment.replays
        .add(Comments(Comment: comment, users: users, time: DateTime.now()));
    emit(maincomment);
  }
}
