import 'package:flutter_bloc/flutter_bloc.dart';

class OnboadingCubit extends Cubit<int> {
  OnboadingCubit() : super(0);

  // Trang tiếp theo
  void next() {
    emit(state + 1);
  }

  // Qoay lại
  void back() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  // Chuyển tới page hiện tại
  void jumpToPage(int page) {
    emit(page);
  }
}
