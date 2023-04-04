import 'package:senior_project_group6/features/auth/common/injections/sign_up_provider_di.dart';
import 'package:senior_project_group6/features/auth/common/repositories/sign_up_repository.dart';

class SignUpRepositoryInject {
  static SignUpRepository? _signUpRepository;

  SignUpRepositoryInject._();

  static SignUpRepository? signUpRepository() {
    _signUpRepository ??= SignUpRepositoryImpl(
      apiProvider: SignUpApiProviderInject.signUpApiProvider()!,
    );
    return _signUpRepository;
  }
}
