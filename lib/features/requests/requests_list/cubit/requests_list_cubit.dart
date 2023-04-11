import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_state.dart';

abstract class RequestsListCubit extends Cubit<RequestsState> {
  RequestsListCubit() : super(RequestsState());
  void getRequests();
}

class RequestsListCubitImpl extends RequestsListCubit {
  final RequestsRepository repository;
  final CacheStorage cacheStorage;

  RequestsListCubitImpl({
    required this.repository,
    required this.cacheStorage,
  }) : super();

  @override
  void getRequests() async {
    emit(RequestsLoadingState());
    final userId = await cacheStorage.getUserId();
    final data = await repository.getRequests(userId.toString());
    if (data?.object != null) {
      final List<ServiceRequest> result = [];

      data?.object.data.forEach((element) {
        result.add(ServiceRequest.fromJson(element));
      });

      emit(RequestsSuccessState(requests: result));
    } else {
      emit(RequestsErrorState(data?.errorMessage));
    }
  }
}
