abstract class Conetntevent {}

class Loadcontent extends Conetntevent {}

class Likecontent extends Conetntevent {
  final String contentId;
  Likecontent(this.contentId);
}

class Followcontent extends Conetntevent {
  final String contentId;
  Followcontent(this.contentId);
}