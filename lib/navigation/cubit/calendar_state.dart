import 'package:equatable/equatable.dart';

class CalendarState extends Equatable {
  final DateTime selectedDay;
  final DateTime focusedDay;

  const CalendarState({
    required this.selectedDay,
    required this.focusedDay,
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
    );
  }

  @override
  List<Object?> get props => [selectedDay, focusedDay];
}
