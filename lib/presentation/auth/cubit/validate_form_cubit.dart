import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/presentation/auth/cubit/validate_form_state.dart';

class ValidateFormCubit extends Cubit<ValidateFormState> {
  ValidateFormCubit() : super(const ValidateFormState());

  void validateUsername(String username) {
    final usernameRegex = RegExp(
        r'^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$');

    if (username.isEmpty) {
      emit(state.copyWith(errorMessageUserName: AppStrings.usernameEmpty));
    } else if (username.length <= 5) {
      emit(state.copyWith(errorMessageUserName: AppStrings.usernameTooShort));
    } else if (!usernameRegex.hasMatch(username)) {
      emit(state.copyWith(errorMessageUserName: AppStrings.usernameInvalid));
    } else {
      emit(state.copyWith(errorMessageUserName: null));
    }
  }

  void validatePassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,20}$');

    if (password.isEmpty) {
      emit(state.copyWith(errorMessagePassword: AppStrings.passwordEmpty));
    } else if (password.length <= 5) {
      emit(state.copyWith(errorMessagePassword: AppStrings.passwordTooShort));
    } else if (!passwordRegex.hasMatch(password)) {
      emit(state.copyWith(errorMessagePassword: AppStrings.passwordInvalid));
    } else {
      emit(state.copyWith(errorMessagePassword: null));
    }
  }

  void validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      emit(state.copyWith(
          errorMessageConfirmPassword: AppStrings.confirmPasswordEmpty));
    } else if (confirmPassword != password) {
      emit(state.copyWith(
          errorMessageConfirmPassword: AppStrings.passwordMismatch));
    } else {
      emit(state.copyWith(errorMessageConfirmPassword: null));
    }
  }
}
