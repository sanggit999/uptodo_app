import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uptodo_app/common/cubit/button/button_cubit.dart';
import 'package:uptodo_app/common/cubit/category/category_display_cubit.dart';
import 'package:uptodo_app/common/cubit/user/user_display_cubit.dart';
import 'package:uptodo_app/core/configs/theme/app_theme.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/core/router/app_router.dart';
import 'package:uptodo_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:uptodo_app/data/auth/sources/auth_api_service.dart';
import 'package:uptodo_app/domain/auth/usecases/is_logged_in.dart';
import 'package:uptodo_app/navigation/cubit/calendar_cubit.dart';
import 'package:uptodo_app/navigation/cubit/category_cubit.dart';
import 'package:uptodo_app/navigation/cubit/priority_cubit.dart';
import 'package:uptodo_app/navigation/cubit/task_cubit.dart';
import 'package:uptodo_app/navigation/cubit/time_cubit.dart';
import 'package:uptodo_app/presentation/onboading/cubit/onboading_cubit.dart';
import 'package:uptodo_app/presentation/splash/cubit/splash_cubit.dart';

import 'presentation/auth/cubit/validate_form_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(IsLoggedInUseCase(
              AuthRepositoryImpl(AuthApiServiceImpl(DioClient()))))
            ..appStarted(),
        ),
        BlocProvider(create: (_) => OnboadingCubit()),
        BlocProvider(create: (_) => UserDisplayCubit()..displayUserInfo()),
        BlocProvider(create: (_) => ButtonCubit()),
        BlocProvider(create: (_) => ValidateFormCubit()),
        BlocProvider(create: (_) => CategoryDisplayCubit()..displayCategory()),
        BlocProvider(
          create: (_) => CalendarCubit(),
        ),
        BlocProvider(
          create: (_) => TimeCubit(),
        ),
        BlocProvider(
          create: (_) => CategoryCubit(),
        ),
        BlocProvider(
          create: (_) => PriorityCubit(),
        ),
        BlocProvider(
          create: (_) => TaskCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'UpTodo',
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
