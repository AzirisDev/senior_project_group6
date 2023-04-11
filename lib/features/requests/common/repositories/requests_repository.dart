import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/requests/common/providers/requests_api_provider.dart';

abstract class RequestsRepository<T> {
  Future<T> getRequests(String studentId);
}

class RequestsRepositoryImpl implements RequestsRepository {
  final RequestsApiProvider apiProvider;

  RequestsRepositoryImpl({required this.apiProvider});

  @override
  Future<AppResponse> getRequests(String userId) async {
    try {
      final data = await apiProvider.getRequests(userId);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }
}
