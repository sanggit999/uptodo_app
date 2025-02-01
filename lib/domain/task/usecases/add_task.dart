import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/data/task/models/task_req.dart';
import 'package:uptodo_app/domain/task/repositories/task_repository.dart';

class AddTaskUseCase implements UseCase<Either, TaskReq> {
  final TaskRepository taskRepository;

  AddTaskUseCase(this.taskRepository);
  @override
  Future<Either> call({TaskReq? params}) async {
    return await taskRepository.addTask(params!);
  }
}
