import 'package:flutter_bloc/flutter_bloc.dart';

class TimeCubit extends Cubit<DateTime> {
  TimeCubit() : super(DateTime.now());

  void selectedTime(DateTime time) {
    emit(time);
  }
}
