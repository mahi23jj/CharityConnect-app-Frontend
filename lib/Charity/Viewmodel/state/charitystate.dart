abstract class Charitystate {}

class Charityinitial extends Charitystate {}

class Catagorytap extends Charitystate {
  final int index;
  Catagorytap(this.index);
}

class Charityloading extends Charitystate {}

class Charitysuccess extends Charitystate {}