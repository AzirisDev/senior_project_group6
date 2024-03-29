import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_cubit.dart';
import 'package:senior_project_group6/features/auth/common/injections/login_repository_di.dart';
import 'package:senior_project_group6/features/auth/common/injections/sign_up_repository_di.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_cubit.dart';
import 'package:senior_project_group6/features/profile/cubit/profile_cubit.dart';
import 'package:senior_project_group6/features/profile/injections/profile_repository_di.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_cubit.dart';

import '../features/splash/splash_page.dart';
import 'package:senior_project_group6/features/requests/common/injections/requests_repository_di.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';

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
        BlocProvider<RequestStatusCubit>(
          create: (context) => RequestStatusCubitImpl(
            repository: RequestsRepositoryInject.requestsRepository()!,
          ),
        ),
        BlocProvider<RequestsListCubit>(
          create: (context) => RequestsListCubitImpl(
            repository: RequestsRepositoryInject.requestsRepository()!,
            cacheStorage: CacheStorage(),
          ),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubitImpl(
            cacheStorage: CacheStorage(),
            profileRepository: ProfileRepositoryInject.profileRepository()!,
          ),
        ),
        BlocProvider<CreateRequestCubit>(
          create: (context) => CreateRequestCubitImpl(
            cacheStorage: CacheStorage(),
            repository: RequestsRepositoryInject.requestsRepository()!,
            firebaseStorage: FirebaseStorage.instance,
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
