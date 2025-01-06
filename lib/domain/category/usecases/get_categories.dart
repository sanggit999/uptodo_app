import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/domain/category/repositories/category_repository.dart';

class GetCategoriesUseCase implements UseCase<Either, dynamic> {
  final CategoryRepository categoryRepository;

  GetCategoriesUseCase(this.categoryRepository);

  @override
  Future<Either> call({params}) async {
    return await categoryRepository.getCategories();
  }
}
