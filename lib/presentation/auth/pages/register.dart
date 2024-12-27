import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/cubit/button/button_cubit.dart';
import 'package:uptodo_app/common/cubit/button/button_state.dart';
import 'package:uptodo_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:uptodo_app/common/widgets/button/basic_reactive_button.dart';
import 'package:uptodo_app/common/widgets/text_form_field/basic_text_form_field.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/auth/models/signup_req.dart';
import 'package:uptodo_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/usecases/signup.dart';
import 'package:uptodo_app/presentation/auth/cubit/validate_form_cubit.dart';
import 'package:uptodo_app/presentation/auth/cubit/validate_form_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  bool isValidate = false;

  void onChanged() {
    setState(() {
      isValidate = _formKey.currentState!.validate();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(create: (context) => ValidateFormCubit())
      ],
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }

          if (state is ButtonSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đăng ký tài khoản thành công'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.go('/login');
          }
        },
        child: Scaffold(
          appBar: const BasicAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _register(),
                const SizedBox(height: 30),
                BlocBuilder<ValidateFormCubit, ValidateFormState>(
                    builder: (context, state) {
                  return Form(
                      key: _formKey,
                      onChanged: onChanged,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleUserName(),
                          const SizedBox(height: 5),
                          _usernameField(context),
                          const SizedBox(height: 20),
                          _titlePassword(),
                          const SizedBox(height: 5),
                          _passwordField(context),
                          const SizedBox(height: 20),
                          _titleConfirmPassword(),
                          const SizedBox(height: 5),
                          _confirmPasswordField(context),
                          const SizedBox(height: 50),
                          _registerButton(context),
                          const SizedBox(height: 10),
                          _titleAlreadyHaveAccount(context)
                        ],
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _register() {
    return const Text(
      AppStrings.register,
      style: TextStyle(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _usernameField(BuildContext context) {
    return BasicTextFormField(
      controller: _usernameController,
      hintText: AppStrings.enterYourUsername,
      validator: (value) {
        context.read<ValidateFormCubit>().validateUsername(value!);
        return context.read<ValidateFormCubit>().state.errorMessageUserName;
      },
    );
  }

  Widget _titleUserName() {
    return const Text(
      AppStrings.username,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _titlePassword() {
    return const Text(
      AppStrings.password,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return BasicTextFormField(
      controller: _passwordController,
      hintText: AppStrings.enterYourPassword,
      obscureText: true,
      validator: (value) {
        context.read<ValidateFormCubit>().validatePassword(value!);
        return context.read<ValidateFormCubit>().state.errordMessagePassword;
      },
    );
  }

  Widget _titleConfirmPassword() {
    return const Text(
      AppStrings.confirmPassword,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return BasicTextFormField(
      controller: _confirmPasswordController,
      hintText: AppStrings.confirmPassword,
      obscureText: true,
      validator: (value) {
        context
            .read<ValidateFormCubit>()
            .validateConfirmPassword(value!, _passwordController.text);
        return context
            .read<ValidateFormCubit>()
            .state
            .errorMessageConfirmPassword;
      },
    );
  }

  Widget _registerButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: isValidate
            ? () {
                context.read<ButtonCubit>().execute(
                      useCase: SignupUseCase(
                          AuthRepositoryImpl(AuthApiServiceImpl(DioClient()))),
                      params: SignUpReq(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      ),
                    );
              }
            : null,
        widget: isValidate
            ? const Text(
                AppStrings.login,
                style: TextStyle(color: AppColors.white),
              )
            : const Text(AppStrings.login),
      );
    });
  }

  Widget _titleAlreadyHaveAccount(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: AppStrings.alreadyHaveAnAccount,
          style: const TextStyle(
              fontSize: 12,
              color: AppColors.lightGray,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                text: AppStrings.login,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push('/login');
                  },
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400))
          ]),
    );
  }
}
