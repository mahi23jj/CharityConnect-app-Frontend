import 'package:travel/Charity/Model/org_profile.dart';

abstract class Charitystate {}

class Charityinitial extends Charitystate {}

class Catagorytap extends Charitystate {
  final int index;
  Catagorytap(this.index);
}

class Charityloading extends Charitystate {}

class Charitysuccess extends Charitystate {
  final OrganizationProfile charity;

  Charitysuccess(this.charity);

}

class charityerror extends Charitystate {
  final String message;
  charityerror(this.message);
}
