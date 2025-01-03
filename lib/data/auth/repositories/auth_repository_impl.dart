import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_app/common/helper/mapper/user.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/data/auth/models/signup_req.dart';
import 'package:uptodo_app/data/auth/models/user.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImpl(this.authApiService);

  @override
  Future<Either> signin(SignInReq signInReq) async {
    var returnedData = await authApiService.signin(signInReq);
    return returnedData.fold(
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

  @override
  Future<Either> signup(SignUpReq signUpReq) async {
    var returnedData = await authApiService.signup(signUpReq);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either> getUser() async {
    var returnedData = await authApiService.getUser();
    return returnedData.fold(
      (erorr) {
        return Left(erorr);
      },
      (data) {
        var user = UserMapper.toEntity(UserModel.fromJson(data['user']));
        return Right(user);
      },
    );
  }
}
