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

  static CategoryModel fromEntity(CategoryEntity categoryEntity) {
    return CategoryModel(
        categoryId: categoryEntity.categoryId,
        userId: categoryEntity.userId,
        name: categoryEntity.name,
        icon: categoryEntity.icon,
        color: categoryEntity.color);
  }
}
