import 'dart:convert';

import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/models/data_response.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/core/utils/mixin.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';

abstract class RequestsApiProvider<T> {
  Future<DataResponse> getRequests(String studentId);
  Future<DataResponse> getRequestsByStatusWorkerId(String status, String workerId);
  Future<DataResponse> getStudentRequestsByStatus(String status, String studentId);
  Future<DataResponse> getStudentRequestsByStatusAndType(String status, String type, String studentId);
  Future<DataResponse> getServices();
  Future<DataResponse> changeStatus(String requestId, String status);
  Future<DataResponse> createRequest(
    String description,
    String location,
    String requestType,
    String status,
    String title,
    String studentId,
    List<String> media,
  );
}

class RequestsApiProviderImpl with ApiProviderMixin implements RequestsApiProvider<MainUser> {
  @override
  Future<DataResponse> getRequests(String userId) async {
    final role = await CacheStorage().getUserRole();
    final requestsEndpoint = role?.toLowerCase() == 'service_worker' ? workerRequestsEndpoint : studentRequestsEndpoint;
    final object = await provideData(endPoint: '$requestsEndpoint/$userId');
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> getRequestsByStatusWorkerId(String status, String workerId) async {
    final object = await provideData(endPoint: workerAndStatusRequestsEndpoint, param: {
      'status': status,
      'serviceWorkerId': workerId,
    });
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> getStudentRequestsByStatus(String status, String studentId) async {
    final object = await provideData(
      endPoint: "$studentRequestsByStatusEndpoint/$studentId",
      param: {
        'status': status,
      },
    );
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> getStudentRequestsByStatusAndType(String status, String type, String studentId) async {
    final object = await provideData(
      endPoint: "$studentRequestsByStatusAndTypeEndpoint/$studentId",
      param: {
        'status': status,
        'type': type,
      },
    );
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> getServices() async {
    final object = await provideData(endPoint: servicesEndpoint);
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> createRequest(
    String description,
    String location,
    String requestType,
    String status,
    String title,
    String studentId,
    List<String> media,
  ) async {
    final object = await provideData(
      endPoint: createRequestEndpoint,
      param: {
        'studentId': studentId,
      },
      body: jsonEncode({
        'description': description,
        'location': location,
        'requestType': requestType,
        'status': status,
        'title': title,
        'media': media,
      }),
    );
    return DataResponse.fromJson(object);
  }

  @override
  Future<DataResponse> changeStatus(String requestId, String status) async {
    final object = await provideData(
      endPoint: "$changeStatusEndpoint/$requestId",
      body: {
        'status': status,
      },
    );
    return DataResponse.fromJson(object);
  }
}
