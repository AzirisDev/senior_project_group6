import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_state.dart';
import 'package:senior_project_group6/features/auth/common/repositories/sign_up_repository.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';
import '../repositories/login_repository.dart';

abstract class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState state) : super(state);
  Future<bool> login(String email, String password);
  Future<bool> signUp(
      String email, String password, String fullName, String phoneNumber);
  Future logout();
}

class AuthCubitImpl extends AuthCubit {
  final LoginRepository loginRepository;
  final SignUpRepository signUpRepository;
  final CacheStorage cacheStorage;

  AuthCubitImpl({
    required this.loginRepository,
    required this.signUpRepository,
    required this.cacheStorage,
  }) : super(AuthState());

  @override
  Future<bool> login(String email, String password) async {
    emit(LoginLoadingState());
    final data = await loginRepository.login(email, password);
    if (data?.object != null && data != null) {
      cacheStorage.setUserId((data?.object as MainUser).id ?? -1);
      emit(LoginSuccessState(user: data?.object as MainUser));
    } else {
      emit(LoginErrorState("Login error"));
    }
    return data?.object != null;
  }

  @override
  Future<bool> signUp(String email, String password, String fullName,
      String phoneNumber) async {
    emit(SignUpLoadingState());
    final data =
        await signUpRepository.signUp(email, password, fullName, phoneNumber);
    if (data?.object != null) {
      cacheStorage.setUserId(data?.object);
      print("ID ${data?.object}");
      emit(SignUpSuccessState());
    } else {
      emit(SignUpErrorState("Sign Up error"));
    }
    return data?.object != null;
  }

  @override
  Future logout() async {
    await loginRepository.logout();
    emit(LogoutState());
  }
}
