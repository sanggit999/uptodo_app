import 'package:dartz/dartz.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  final AuthRepository authRepository;

  GetUserUseCase(this.authRepository);

  @override
  Future<Either> call({params}) async {
    return await authRepository.getUser();
  }
}
