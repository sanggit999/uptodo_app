import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/user/user_display_state.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/usecases/get_user.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserDisplayLoading());

  void displayUserInfo() async {
    var returnedData = await GetUserUseCase(
            AuthRepositoryImpl(AuthApiServiceImpl(DioClient())))
        .call();
    returnedData.fold(
      (erorr) {
        emit(UserDisplayFailure());
      },
      (data) {
        emit(UserDisplayLoaded(userEntity: data));
      },
    );
  }
}