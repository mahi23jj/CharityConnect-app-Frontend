abstract class Charityevent {}

class tap extends Charityevent {
  int currentidx;
  tap(this.currentidx);
}

class getcharitydetail extends Charityevent {
  String id;
  getcharitydetail(this.id);
}