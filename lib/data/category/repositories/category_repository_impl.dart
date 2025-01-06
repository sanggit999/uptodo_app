import 'package:dartz/dartz.dart';
import 'package:uptodo_app/common/helper/mapper/category.dart';
import 'package:uptodo_app/data/category/models/category.dart';
import 'package:uptodo_app/data/category/models/category_req.dart';
import 'package:uptodo_app/data/category/source/category_api_service.dart';
import 'package:uptodo_app/domain/category/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService categoryApiService;

  CategoryRepositoryImpl(this.categoryApiService);

  @override
  Future<Either> addCategory(CategoryReq categoryReq) async {
    var returnedData = await categoryApiService.addCategory(categoryReq);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<Either> getCategories() async {
    var returnedData = await categoryApiService.getCategories();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var categories = List.from(data['categories'])
          .map((item) => CategoryMapper.toEntity(CategoryModel.fromJson(item)))
          .toList();
      return Right(categories);
    });
  }
}
