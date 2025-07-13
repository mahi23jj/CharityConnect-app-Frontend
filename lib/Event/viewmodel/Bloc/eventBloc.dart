import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Event/viewmodel/Event/eventsevent.dart';
import 'package:travel/Event/viewmodel/repository/Eventrepo.dart';
import 'package:travel/Event/viewmodel/state/eventstate.dart';

class Eventbloc extends Bloc<EventsEvent, Eventstate> {
  final Eventrepo eventrepo;
  Eventbloc(this.eventrepo) : super(Eventinitial()) {
    on<GetEvents>((event, emit) async {
      emit(Eventloading());
      try {
        final upcomingEvents = await eventrepo.getEvent(
            event.search, event.location, event.category, event.supportGroups);
        emit(Eventloaded(upcomingEvents));
      } catch (e) {
        emit(Eventerror(e.toString()));
      }
    });

    on<GetEventsdetail>((event, emit) async {
        emit(Eventloading());
        try {
          final Eventsdetail = await eventrepo.getEventbyId(event.id);
          emit(Eventsdetailstate(Eventsdetail));
        } catch (e) {
          emit(Eventerror(e.toString()));
        }
      // if (state is Eventloaded) {
      // }
    });
  }
}
