import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/models/data_response.dart';
import 'package:senior_project_group6/core/utils/mixin.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';

abstract class RequestsApiProvider<T> {
  Future<DataResponse> getRequests(String studentId);
}

class RequestsApiProviderImpl
    with ApiProviderMixin
    implements RequestsApiProvider<MainUser> {
  @override
  Future<DataResponse> getRequests(String studentId) async {
    final object = await provideData(endPoint: '$requestsEndpoint/$studentId');
    return DataResponse.fromJson(object);
  }
}
