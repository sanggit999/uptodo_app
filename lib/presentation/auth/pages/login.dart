import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/cubit/button_cubit.dart';
import 'package:uptodo_app/common/cubit/button_state.dart';
import 'package:uptodo_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:uptodo_app/common/widgets/button/basic_reactive_button.dart';
import 'package:uptodo_app/common/widgets/text_form_field/basic_text_form_field.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/auth/models/signin_req.dart';
import 'package:uptodo_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/usecases/signin.dart';
import 'package:uptodo_app/presentation/auth/cubit/validate_form_cubit.dart';
import 'package:uptodo_app/presentation/auth/cubit/validate_form_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

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
            context.go('/app_navigation');
          }
        },
        child: Scaffold(
          appBar: const BasicAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _login(),
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
                          const SizedBox(height: 50),
                          _loginButton(context),
                          const SizedBox(height: 10),
                          _titleDontHaveAccount(context)
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

  Widget _login() {
    return const Text(
      AppStrings.login,
      style: TextStyle(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
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

  Widget _loginButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: isValidate
            ? () {
                context.read<ButtonCubit>().execute(
                      useCase: SigninUseCase(
                          AuthRepositoryImpl(AuthApiServiceImpl(DioClient()))),
                      params: SignInReq(
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

  Widget _titleDontHaveAccount(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: AppStrings.dontHaveAnAccount,
          style: const TextStyle(
              fontSize: 12,
              color: AppColors.lightGray,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                text: AppStrings.register,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push('/register');
                  },
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400))
          ]),
    );
  }
}
