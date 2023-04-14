import 'package:senior_project_group6/core/models/response.dart';
import 'package:senior_project_group6/features/requests/common/providers/requests_api_provider.dart';

abstract class RequestsRepository<T> {
  Future<T> getRequests(String studentId);
  Future<T> getRequestsByStatusWorkerId(String status, String workerId);
  Future<T> getServices();
  Future<T> changeStatus(String requestId, String status);
  Future<T> createRequest(
    String description,
    String location,
    String requestType,
    String status,
    String title,
    String studentId,
    List<String> media,
  );
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

  @override
  Future<AppResponse> getRequestsByStatusWorkerId(String status, String workerId) async {
    try {
      final data = await apiProvider.getRequestsByStatusWorkerId(status, workerId);
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

  @override
  Future<AppResponse> createRequest(
    String description,
    String location,
    String requestType,
    String status,
    String title,
    String studentId,
    List<String> media,
  ) async {
    try {
      final data = await apiProvider.createRequest(description, location, requestType, status, title, studentId, media);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }

  @override
  Future<AppResponse> changeStatus(String requestId, String status) async {
    try {
      final data = await apiProvider.changeStatus(requestId, status);
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.withError(e.toString());
    }
  }
}
