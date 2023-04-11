import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/auth/common/providers/sign_up_api_provider.dart';

abstract class SignUpRepository<T> {
  Future<T> signUp(String email, String password, String fullName, String phoneNumber);
}

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpApiProvider apiProvider;

  SignUpRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<AppResponse> signUp(String email, String password, String fullName, String phoneNumber) async {
    try {
      final data = await apiProvider.signUp(email, password, fullName, phoneNumber);
      if (data == null) {
        return AppResponse.withError("Sign up failed");
      }
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }
}
