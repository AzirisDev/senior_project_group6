import 'package:senior_project_group6/features/requests/common/injections/requests_api_provider_di.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';

class RequestsRepositoryInject {
  static RequestsRepository? _requestsRepository;

  RequestsRepositoryInject._();

  static RequestsRepository? requestsRepository() {
    _requestsRepository ??= RequestsRepositoryImpl(
      apiProvider: RequestsApiProviderInject.loginApiProvider()!,
    );
    return _requestsRepository;
  }
}
