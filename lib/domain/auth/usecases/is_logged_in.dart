import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/domain/auth/repositories/auth_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  final AuthRepository authRepository;

  IsLoggedInUseCase(this.authRepository);

  @override
  Future<bool> call({params}) async {
    return await authRepository.isLoggedIn();
  }
}
