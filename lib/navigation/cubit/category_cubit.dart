import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<String?> {
  CategoryCubit() : super(null);

  void itemSelection(String categoryId) {
    emit(categoryId);
  }

  void resetSelection() {
    emit(null);
  }
}
