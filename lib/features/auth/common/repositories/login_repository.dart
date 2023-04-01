import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/auth/common/providers/login_api_provider.dart';

abstract class LoginRepository<T> {
  Future<T> login(String email, String password);
  Future<AppResponse> logout();
  // Future<AppResponse> getUser();
  // Future<String?> getToken();
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiProvider apiProvider;

  LoginRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<AppResponse> login(String email, String password) async {
    try {
      final data = await apiProvider.login(email, password);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }

  @override
  Future<AppResponse> logout() async {
    try {
      // await dBProvider.removeUser();
      return AppResponse.success(null);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }

  // @override
  // Future<AppResponse> getUser() async {
  //   final rawUser = await dBProvider.getUser();
  //   if (rawUser != null) {
  //     final mainUser = MainUser.fromJson(json.decode(rawUser!));
  //     return AppResponse.success(mainUser);
  //   }
  //   return AppResponse.withError(null);
  // }

  // @override
  // Future<String?> getToken() async => await dBProvider.getToken();
}
