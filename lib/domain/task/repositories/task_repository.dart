import 'package:dartz/dartz.dart';
import 'package:uptodo_app/data/task/models/task_req.dart';

abstract class TaskRepository {
  Future<Either> addTask(TaskReq taskReq);

  Future<Either> getTask();
}
