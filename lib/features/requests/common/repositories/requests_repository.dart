import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/requests/common/providers/requests_api_provider.dart';

abstract class RequestsRepository<T> {
  Future<T> getRequests(String studentId);
  Future<T> getServices();
}

class RequestsRepositoryImpl implements RequestsRepository {
  final RequestsApiProvider apiProvider;

  RequestsRepositoryImpl({required this.apiProvider});

  @override
  Future<AppResponse> getRequests(String studentId) async {
    try {
      final data = await apiProvider.getRequests(studentId);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }

  @override
  Future<AppResponse> getServices() async {
    try {
      final data = await apiProvider.getServices();
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }
}
