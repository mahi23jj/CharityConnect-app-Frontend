import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Charity/Viewmodel/Event/charityevent.dart';
import 'package:travel/Charity/Viewmodel/state/charitystate.dart';

class CharityBloc extends Bloc<Charityevent, Charitystate> {
  CharityBloc() : super(Charityinitial()) {
    on<tap>((event, emit) async {
      emit(Catagorytap(event.currentidx));
    });
  }
}
