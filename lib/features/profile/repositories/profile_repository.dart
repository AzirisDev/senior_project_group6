import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/profile/providers/profile_api_provider.dart';

abstract class ProfileRepository<T> {
  Future<T> getUser(String studentId);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiProvider apiProvider;

  ProfileRepositoryImpl({required this.apiProvider});

  @override
  Future<AppResponse> getUser(String studentId) async {
    try {
      final data = await apiProvider.getUser(studentId);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }
}
