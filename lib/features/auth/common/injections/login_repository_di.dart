import '../repositories/login_repository.dart';
import 'login_api_provider_di.dart';

class LoginRepositoryInject {
  static LoginRepository? _loginRepository;

  LoginRepositoryInject._();

  static LoginRepository? loginRepository() {
    _loginRepository ??= LoginRepositoryImpl(
      apiProvider: LoginApiProviderInject.loginApiProvider()!,
    );
    return _loginRepository;
  }
}
