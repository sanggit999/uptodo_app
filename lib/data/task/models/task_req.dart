import 'package:uptodo_app/data/category/models/category.dart';

class TaskReq {
  final String userId;
  final String title;
  final String description;
  final String duaDate;
  final String dueHour;
  final CategoryModel? category;
  final int? priority;
  final bool isCompleted;
  final DateTime createdAt;

  TaskReq(
      {required this.userId,
      required this.title,
      required this.description,
      required this.duaDate,
      required this.dueHour,
      required this.category,
      required this.priority,
      required this.isCompleted,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'duaDate': duaDate,
      'dueHour': dueHour,
      'category': category,
      'priority': priority,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
    };
  }
}
