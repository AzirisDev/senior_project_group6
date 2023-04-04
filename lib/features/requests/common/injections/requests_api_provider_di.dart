import 'package:senior_project_group6/features/requests/common/providers/requests_api_provider.dart';

class RequestsApiProviderInject {
  static RequestsApiProvider? _requestsApiProvider;

  RequestsApiProviderInject._();

  static RequestsApiProvider? loginApiProvider() {
    _requestsApiProvider ??= RequestsApiProviderImpl();
    return _requestsApiProvider;
  }
}
