import 'package:uptodo_app/domain/auth/entities/user.dart';

abstract class UserDisplayState {}

class UserDisplayLoading extends UserDisplayState {}

class UserDisplayLoaded extends UserDisplayState {
  final UserEntity userEntity;

  UserDisplayLoaded({required this.userEntity});
}

class UserDisplayFailure extends UserDisplayState {}
