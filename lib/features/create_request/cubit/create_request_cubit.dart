import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_state.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';

abstract class CreateRequestCubit extends Cubit<CreateRequestState> {
  CreateRequestCubit(CreateRequestState state) : super(state);
  void getServices();

  void createRequest({
    String description,
    String location,
    String requestType,
    String title,
  });
}

class CreateRequestCubitImpl extends CreateRequestCubit {
  final RequestsRepository repository;
  final CacheStorage cacheStorage;

  CreateRequestCubitImpl({
    required this.repository,
    required this.cacheStorage,
  }) : super(CreateRequestState());

  @override
  void getServices() async {
    emit(GetServicesLoadingState());

    final data = await repository.getServices();
    if (data?.object != null) {
      final List<Service> result = [];

      data?.object.data.forEach((element) {
        result.add(Service.fromJson(element));
      });

      emit(GetServicesSuccessState(services: result));
    } else {
      emit(GetServicesErrorState(data?.errorMessage));
    }
  }

  @override
  void createRequest({
    String description = '',
    String location = '',
    String requestType = '',
    String title = '',
  }) async {
    emit(CreateRequestLoadingState());

    final studentId = await cacheStorage.getUserId();

    final data = await repository.createRequest(
      description,
      location,
      requestType,
      'ACTIVE',
      title,
      studentId.toString(),
    );

    if (data?.object != null) {
      emit(CreateRequestSuccessState(
          request: ServiceRequest.fromJson(data?.object.data)));
    } else {
      emit(CreateRequestErrorState(data.errorMessage));
    }
  }
}
