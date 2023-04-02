import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_cubit.dart';
import 'package:senior_project_group6/features/auth/common/injections/login_repository_di.dart';
import 'package:senior_project_group6/features/auth/common/injections/sign_up_repository_di.dart';

import '../features/splash/splash_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubitImpl(
            loginRepository: LoginRepositoryInject.loginRepository()!,
            signUpRepository: SignUpRepositoryInject.signUpRepository()!,
            cacheStorage: CacheStorage(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
