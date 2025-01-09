import 'package:uptodo_app/data/category/models/category.dart';

class TaskEntity {
  final String? taskId;
  final String? userId;
  final String? title;
  final String? description;
  final String? duaDate;
  final String? dueHour;
  final CategoryModel? category;
  final int? priority;
  final bool? isCompleted;
  final DateTime? createdAt;

  TaskEntity(
      {required this.taskId,
      required this.userId,
      required this.title,
      required this.description,
      required this.duaDate,
      required this.dueHour,
      required this.category,
      required this.priority,
      required this.isCompleted,
      required this.createdAt});
}
