import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uptodo_app/core/constants/app_url.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';

abstract class AuthApiService {
  Future<Either> signin(SignInReq signInReq);
}

class AuthApiServiceImpl implements AuthApiService {
  final DioClient dioClient;

  AuthApiServiceImpl(this.dioClient);

  @override
  Future<Either> signin(SignInReq signInReq) async {
    try {
      var response =
          await dioClient.post(AppUrl.signin, data: signInReq.toMap());
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
