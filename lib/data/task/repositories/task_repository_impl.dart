import 'package:dartz/dartz.dart';
import 'package:uptodo_app/data/task/models/task_req.dart';
import 'package:uptodo_app/data/task/sources/task_api_service.dart';
import 'package:uptodo_app/domain/task/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskApiService taskApiService;

  TaskRepositoryImpl(this.taskApiService);

  @override
  Future<Either> addTask(TaskReq taskReq) async {
    var returnedData = await taskApiService.addTask(taskReq);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<Either> getTask() async {
    var returnedData = await taskApiService.getTask();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
