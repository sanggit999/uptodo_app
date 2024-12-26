import 'package:dartz/dartz.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/data/auth/models/signup_req.dart';

abstract class AuthRepository {
  Future<Either> signin(SignInReq signInReq);

  Future<Either> signup(SignUpReq signUpReq);

  Future<bool> isLoggedIn();

  Future<Either> getUser();
}
