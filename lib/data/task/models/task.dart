import 'package:uptodo_app/data/category/models/category.dart';

class TaskModel {
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

  TaskModel(
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

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['_id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      duaDate: json['dueDate'],
      dueHour: json['dueHour'],
      category: CategoryModel.fromJson(json['category']),
      priority: json['priority'],
      isCompleted: json['isCompleted'],
      createdAt: json['createdAt'],
    );
  }
}
