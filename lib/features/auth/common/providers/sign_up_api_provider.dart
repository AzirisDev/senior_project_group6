import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/mixin.dart';

abstract class SignUpApiProvider<T> {
  Future<T> signUp(
      String email, String password, String fullName, String phoneNumber);
}

class SignUpApiProviderImpl
    with ApiProviderMixin
    implements SignUpApiProvider<int> {
  @override
  Future<int> signUp(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final object = await provideData(
      endPoint: authenticationSignUpEndpoint,
      body: {
        'fullName': fullName,
        'password': password,
        'phoneNumber': phoneNumber,
        'role': "STUDENT",
        'universityEmail': email,
      },
    );
    return object['id'];
  }
}
