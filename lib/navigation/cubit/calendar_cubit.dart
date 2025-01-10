import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/navigation/cubit/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
        ));

  void selectedDay(DateTime selectedDay, DateTime focusedDay) {
    emit(state.copyWith(selectedDay: selectedDay, focusedDay: focusedDay));
  }

  void resetSelectedDate() {
    emit(state.copyWith(
      selectedDay: DateTime.now(),
      focusedDay: DateTime.now(),
    ));
  }
}
