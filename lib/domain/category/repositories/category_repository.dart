import 'package:dartz/dartz.dart';
import 'package:uptodo_app/data/category/models/category_req.dart';

abstract class CategoryRepository {
  Future<Either> addCategory(CategoryReq categoryReq);

  Future<Either> getCategories();
}
