import 'package:dartz/dartz.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';

abstract class AuthRepository {

    Future<Either> signin(SignInReq signInReq);

}