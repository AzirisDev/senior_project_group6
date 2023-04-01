import 'package:bloc/bloc.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_state.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';
import '../repositories/login_repository.dart';

abstract class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState state) : super(state);
  Future<bool> login(String email, String password);
  Future logout();
  // Future<String?> getToken();
  // Future getUser();
}

class AuthCubitImpl extends AuthCubit {
  final LoginRepository repository;

  AuthCubitImpl({
    required this.repository,
  }) : super(AuthState());

  @override
  Future<bool> login(String email, String password) async {
    emit(LoginLoadingState());
    final data = await repository.login(email, password);
    if (data?.object != null) {
      emit(LoginSuccessState(user: data?.object as MainUser));
    } else {
      emit(LoginErrorState(data?.object));
    }
    return data?.object != null;
  }

  @override
  Future logout() async {
    await repository.logout();
    // await getIt<SecureStorage>().removeAllData();
    emit(LogoutState());
  }

  // @override
  // Future<String?> getToken() async => await repository.getToken();

  // @override
  // Future getUser() async {
  //   final data = await repository.getUser();
  //   if (data.object != null) {
  //     emit(data.object as MainUser);
  //     return;
  //   }
  //   emit(null);
  // }
}
