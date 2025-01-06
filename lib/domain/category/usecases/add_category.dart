import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/data/category/models/category_req.dart';
import 'package:uptodo_app/domain/category/repositories/category_repository.dart';

class AddCategoryUseCase implements UseCase<Either, CategoryReq> {
  final CategoryRepository categoryRepository;

  AddCategoryUseCase(this.categoryRepository);

  @override
  Future<Either> call({CategoryReq? params}) async {
    return await categoryRepository.addCategory(params!);
  }
}
