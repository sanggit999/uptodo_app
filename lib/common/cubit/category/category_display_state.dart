import 'package:uptodo_app/domain/category/entities/category.dart';

abstract class CategoryDisplayState {}

class CategoryDisplayLoading extends CategoryDisplayState {}

class CategoryDisplayLoaded extends CategoryDisplayState {
  final List <CategoryEntity> categoryEntity;

  CategoryDisplayLoaded({required this.categoryEntity});
}

class CategoryDisplayFailure extends CategoryDisplayState {}
