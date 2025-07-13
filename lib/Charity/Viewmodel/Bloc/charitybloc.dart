import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Charity/Viewmodel/Event/charityevent.dart';
import 'package:travel/Charity/Viewmodel/repository/charityrepo.dart';
import 'package:travel/Charity/Viewmodel/state/charitystate.dart';

class CharityBloc extends Bloc<Charityevent, Charitystate> {
  final Charityrepo charityrepo;

  CharityBloc(this.charityrepo) : super(Charityinitial()) {
    on<tap>((event, emit) async {
      emit(Catagorytap(event.currentidx));
    });

    on<getcharitydetail>(
      (event, emit) {
        emit(Charityloading());
        try {
          charityrepo.getcharitydetail(event.id).then((value) {
            emit(Charitysuccess(value));
          });
        } catch (e) {
          emit(charityerror(e.toString()));
        }
      },
    );
  }
}
