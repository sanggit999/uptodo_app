import 'package:uptodo_app/data/task/models/task.dart';
import 'package:uptodo_app/domain/task/entities/task.dart';

class TaskMapper {
  static TaskEntity taskEntity(TaskModel taskModel) {
    return TaskEntity(
      taskId: taskModel.taskId,
      userId: taskModel.userId,
      title: taskModel.title,
      description: taskModel.description,
      duaDate: taskModel.duaDate,
      dueHour: taskModel.dueHour,
      category: taskModel.category,
      priority: taskModel.priority,
      isCompleted: taskModel.isCompleted,
      createdAt: taskModel.createdAt,
    );
  }
}
