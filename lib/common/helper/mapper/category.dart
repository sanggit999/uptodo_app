import 'package:uptodo_app/data/category/models/category.dart';
import 'package:uptodo_app/domain/category/entities/category.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel categoryModel) {
    return CategoryEntity(
        categoryId: categoryModel.categoryId,
        userId: categoryModel.userId,
        name: categoryModel.name,
        icon: categoryModel.icon,
        color: categoryModel.color);
  }
}
