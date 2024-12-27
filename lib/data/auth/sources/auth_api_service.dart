import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uptodo_app/core/constants/app_url.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/data/auth/models/signup_req.dart';

abstract class AuthApiService {
  Future<Either> signin(SignInReq signInReq);

  Future<Either> signup(SignUpReq signUpReq);

  Future<Either> getUser();
}

class AuthApiServiceImpl implements AuthApiService {
  final DioClient dioClient;

  AuthApiServiceImpl(this.dioClient);

  @override
  Future<Either> signin(SignInReq signInReq) async {
    try {
      var response =
          await dioClient.post(AppUrl.signin, data: signInReq.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signup(SignUpReq signUpReq) async {
    try {
      var response =
          await dioClient.post(AppUrl.signup, data: signUpReq.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var response = await dioClient.get(AppUrl.getUser);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
