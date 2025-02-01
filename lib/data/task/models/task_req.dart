class TaskReq {
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime dueHour;
  final String category;
  final String priority;
  final bool isCompleted;
  final DateTime createdAt;

  TaskReq(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.dueHour,
      required this.category,
      required this.priority,
      required this.isCompleted,
      required this.createdAt});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'dueHour': dueHour.toIso8601String(),
      'category': category,
      'priority': priority,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
