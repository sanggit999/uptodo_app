import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uptodo_app/core/constants/app_url.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/task/models/task_req.dart';

abstract class TaskApiService {
  Future<Either> addTask(TaskReq taskReq);

  Future<Either> getTask();
}

class TaskApiServiceImpl implements TaskApiService {
  final DioClient dioClient;

  TaskApiServiceImpl(this.dioClient);

  @override
  Future<Either> addTask(TaskReq taskReq) async {
    try {
      print('Data: =>${taskReq.toJson()}');
      var response =
          await dioClient.post(AppUrl.addTask, data: taskReq.toJson());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTask() async {
    try {
      var response = await dioClient.get(AppUrl.getTasks);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
