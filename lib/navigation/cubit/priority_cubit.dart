import 'package:flutter_bloc/flutter_bloc.dart';

class PriorityCubit extends Cubit<int> {
  PriorityCubit() : super(0);

  void itemSelection(int index) {
    emit(index);
  }
}
