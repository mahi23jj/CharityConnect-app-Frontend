import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Homepage/model/comment.dart';
import 'package:travel/Homepage/model/content.dart';
import 'package:travel/Homepage/viewmode/Event/homeevent.dart';
import 'package:travel/Homepage/viewmode/repository/home_repository.dart';
import 'package:travel/Homepage/viewmode/state/home_sate.dart';
import 'package:travel/autentication/Login/logindata.dart';

class CommentProvider extends Bloc<Conetntevent, Conetntstate> {
  final content_repository contentrepo;

  CommentProvider(this.contentrepo) : super(Contentinital()) {
    on<Loadcontent>(
      (event, emit) async {
        emit(LoadingState());
        try {
          final contents = await contentrepo.featchcontent();
          emit(LoadcontentState(date: contents));
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      },
    );

    on<Likecontent>((event, emit) async {
      if (state is LoadcontentState) {
        final currentState = state as LoadcontentState;

        try {
          final isNowLiked =
              await contentrepo.like(event.contentId); // true or false

          List<Content> updatedContent = currentState.date.map((content) {
            if (content.id == event.contentId) {
              final newLikeCount =
                  isNowLiked ? content.likes + 1 : content.likes - 1;
              return Content(
                  id: content.id,
                  post: content.post,
                  discription: content.discription,
                  profile: content.profile,
                  username: content.username,
                  tags: content.tags,
                  isLiked: isNowLiked,
                  likes: newLikeCount,
                  isFollowed: content.isFollowed);
            } else {
              return content;
            }
          }).toList();

          emit(LoadcontentState(date: updatedContent));
        } catch (e) {
          // handle error if needed
        }
      }
    });

    on<Followcontent>((event, emit) async {
      if (state is LoadcontentState) {
        final currentState = state as LoadcontentState;
        try {
          final isNowfollow =
              await contentrepo.Follow(event.contentId); // true or false

          List<Content> updatedContent = currentState.date.map((content) {
            if (content.id == event.contentId) {
              // final newLikeCount =
              //     isNowLiked ? content.likes + 1 : content.likes - 1;
              return Content(
                  id: content.id,
                  post: content.post,
                  discription: content.discription,
                  profile: content.profile,
                  username: content.username,
                  tags: content.tags,
                  isLiked: content.isLiked,
                  likes: content.likes,
                  isFollowed: isNowfollow);
            } else {
              return content;
            }
          }).toList();

          emit(LoadcontentState(date: updatedContent));
        } catch (e) {
          // handle error if needed
        }
      }
    });

    //   on<Likecontent>((event, emit) async {
    //     if(state is LoadcontentState){
    //           final currentState = state as LoadcontentState;

    //           try{
    //               final like= await contentrepo.like(event.contentId);
    //               final updatedcontent = currentState.date.map((contents)=>{
    //                 if(contents.id==event.contentId){
    //                   final newLikeCount = like ? contents.likes + 1 : contents.likes - 1;

    //         return content.copyWith(
    //           isLikedByUser: like,
    //           like: newLikeCount,
    //         );

    //                 }

    //               });

    //           }catch(e){

    //           }

    //     // emit(LikeState(like: like));
    // }}

    // );
  }
}
