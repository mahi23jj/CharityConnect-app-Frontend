import '../../autentication/Login/logindata.dart';

class Comments {
  final user users;
  final String Comment;
  final DateTime time;
  final List<Comments>replays=[];

  Comments({required this.Comment, required this.users, required this.time});
}

class replays {
  final String sender;
  final String reciver;
  final Comments answer;

  replays({required this.sender, required this.reciver, required this.answer});
}
