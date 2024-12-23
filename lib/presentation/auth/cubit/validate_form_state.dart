import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'validate_form_state.g.dart';
@CopyWith()
class ValidateFormState extends Equatable {
  final String? errorMessageUserName;
  final String? errordMessagePassword;
  final String? errorMessageConfirmPassword;

  const ValidateFormState({
    this.errorMessageUserName,
    this.errordMessagePassword,
    this.errorMessageConfirmPassword,
  });

  @override
  List<Object?> get props => [
        errorMessageUserName,
        errordMessagePassword,
        errorMessageConfirmPassword
      ];
}