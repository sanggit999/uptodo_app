import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImpl(this.authApiService);

  @override
  Future<Either> signin(SignInReq signInReq) async {
    var data = await authApiService.signin(signInReq);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }
}
