import 'package:flutter_bloc/flutter_bloc.dart';

class PriorityCubit extends Cubit<String> {
  PriorityCubit() : super('0');

  void itemSelection(int index) {
    emit(index.toString());
  }

  void resetSelection() {
    emit('0');
  }
}
