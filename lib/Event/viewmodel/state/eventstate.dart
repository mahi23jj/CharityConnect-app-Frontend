import 'package:travel/Event/Model/event_model.dart';

abstract class Eventstate {}

class Eventinitial extends Eventstate {}

class Eventloading extends Eventstate {}

class Eventerror extends Eventstate {
  final String message;
  Eventerror(this.message);
}

class Eventloaded extends Eventstate {
  final List<Eventmodel> upcamingevents;
  Eventloaded(this.upcamingevents);
}