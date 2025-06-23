import 'package:flutter_bloc/flutter_bloc.dart';

class Profileprovider extends Cubit<int> {
  Profileprovider() : super(0);

  int currentidx = 0;

  void ontap(int idx) {
    currentidx = idx;
    emit(currentidx);
  }
}
