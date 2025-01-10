// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_form_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidateFormStateCWProxy {
  ValidateFormState errorMessageUserName(String? errorMessageUserName);

  ValidateFormState errorMessagePassword(String? errorMessagePassword);

  ValidateFormState errorMessageConfirmPassword(
      String? errorMessageConfirmPassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateFormState call({
    String? errorMessageUserName,
    String? errorMessagePassword,
    String? errorMessageConfirmPassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValidateFormState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValidateFormState.copyWith.fieldName(...)`
class _$ValidateFormStateCWProxyImpl implements _$ValidateFormStateCWProxy {
  const _$ValidateFormStateCWProxyImpl(this._value);

  final ValidateFormState _value;

  @override
  ValidateFormState errorMessageUserName(String? errorMessageUserName) =>
      this(errorMessageUserName: errorMessageUserName);

  @override
  ValidateFormState errorMessagePassword(String? errorMessagePassword) =>
      this(errorMessagePassword: errorMessagePassword);

  @override
  ValidateFormState errorMessageConfirmPassword(
          String? errorMessageConfirmPassword) =>
      this(errorMessageConfirmPassword: errorMessageConfirmPassword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateFormState call({
    Object? errorMessageUserName = const $CopyWithPlaceholder(),
    Object? errorMessagePassword = const $CopyWithPlaceholder(),
    Object? errorMessageConfirmPassword = const $CopyWithPlaceholder(),
  }) {
    return ValidateFormState(
      errorMessageUserName: errorMessageUserName == const $CopyWithPlaceholder()
          ? _value.errorMessageUserName
          // ignore: cast_nullable_to_non_nullable
          : errorMessageUserName as String?,
      errorMessagePassword: errorMessagePassword == const $CopyWithPlaceholder()
          ? _value.errorMessagePassword
          // ignore: cast_nullable_to_non_nullable
          : errorMessagePassword as String?,
      errorMessageConfirmPassword:
          errorMessageConfirmPassword == const $CopyWithPlaceholder()
              ? _value.errorMessageConfirmPassword
              // ignore: cast_nullable_to_non_nullable
              : errorMessageConfirmPassword as String?,
    );
  }
}

extension $ValidateFormStateCopyWith on ValidateFormState {
  /// Returns a callable class that can be used as follows: `instanceOfValidateFormState.copyWith(...)` or like so:`instanceOfValidateFormState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidateFormStateCWProxy get copyWith =>
      _$ValidateFormStateCWProxyImpl(this);
}
