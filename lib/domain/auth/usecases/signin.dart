import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class SigninUseCase implements UseCase<Either, SignInReq> {
  final AuthRepository authRepository;

  SigninUseCase(this.authRepository);

  @override
  Future<Either> call({SignInReq? params}) async {
    return await authRepository.signin(params!);
  }
}
