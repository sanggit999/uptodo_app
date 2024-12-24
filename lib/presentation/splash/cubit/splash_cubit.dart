import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/domain/auth/usecases/is_logged_in.dart';
import 'package:uptodo_app/presentation/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.isLoggedInUseCase) : super(DisplaySplash());

  final IsLoggedInUseCase isLoggedInUseCase;

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLogged = await isLoggedInUseCase.call();
    if (isLogged) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
