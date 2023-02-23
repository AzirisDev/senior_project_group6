import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState);

  void login() async {
    emit(LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(LoginSuccessState());
  }

  void signUp() async {
    emit(LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(LoginSuccessState());
  }
}
