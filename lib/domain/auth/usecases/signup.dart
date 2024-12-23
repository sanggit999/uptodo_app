import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/data/auth/models/signup_req.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class SignupUseCase implements UseCase<Either, SignUpReq> {
  final AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  @override
  Future<Either> call({SignUpReq? params}) async {
    return await authRepository.signup(params!);
  }
}
