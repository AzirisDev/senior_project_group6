import 'package:senior_project_group6/features/auth/common/providers/sign_up_api_provider.dart';

class SignUpApiProviderInject {
  static SignUpApiProvider? _signUpApiProvider;

  SignUpApiProviderInject._();

  static SignUpApiProvider? signUpApiProvider() {
    _signUpApiProvider ??= SignUpApiProviderImpl();
    return _signUpApiProvider;
  }
}
