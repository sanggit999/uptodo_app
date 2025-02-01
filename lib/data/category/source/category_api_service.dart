import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uptodo_app/core/constants/app_url.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/category/models/category_req.dart';

abstract class CategoryApiService {
  Future<Either> addCategory(CategoryReq categoryReq);

  Future<Either> getCategories();
}

class CategoryApiServiceImpl implements CategoryApiService {
  final DioClient dioClient;

  CategoryApiServiceImpl(this.dioClient);

  @override
  Future<Either> addCategory(CategoryReq categoryReq) async {
    try {
      var response =
          await dioClient.post(AppUrl.addCategory, data: categoryReq.toJson());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getCategories() async {
    try {
      var response = await dioClient.get(AppUrl.getCategories);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
