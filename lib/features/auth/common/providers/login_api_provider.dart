import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/mixin.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';

abstract class LoginApiProvider<T> {
  Future<T> login(String email, String password);
}

class LoginApiProviderImpl
    with ApiProviderMixin
    implements LoginApiProvider<MainUser> {
  @override
  Future<MainUser> login(String email, String password) async {
    final object = await provideData(
      endPoint: authenticationEndpoint,
      param: {
        'Password': email,
        'UniversityEmail': password,
      },
    );
    return MainUser.fromJson(object);
  }

  // @override
  // Future<Customer> getUser(String? token) async {
  //   final object = await provideData(endPoint: getUserEndpoint, token: token);
  //   return Customer.fromJson(object);
  // }
}