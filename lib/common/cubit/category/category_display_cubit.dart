import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/category/category_display_state.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/category/repositories/category_repository_impl.dart';
import 'package:uptodo_app/data/category/source/category_api_service.dart';
import 'package:uptodo_app/domain/category/usecases/get_categories.dart';

class CategoryDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoryDisplayCubit() : super(CategoryDisplayLoading());

  void displayCategory() async {
    var returedData = await GetCategoriesUseCase(
            CategoryRepositoryImpl(CategoryApiServiceImpl(DioClient())))
        .call();
    returedData.fold((error) {
      emit(CategoryDisplayFailure());
    }, (data) {
      emit(CategoryDisplayLoaded(categoryEntity: data));
    });
  }
}
