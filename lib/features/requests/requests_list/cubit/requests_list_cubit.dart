import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_state.dart';

abstract class RequestsListCubit extends Cubit<RequestsState> {
  RequestsListCubit() : super(RequestsState());
  void getRequestsByUserId();
  void getRequestsByStatusWorkerId(String status);
  void getStudentRequestsByStatusAndType(String status, String type);
}

class RequestsListCubitImpl extends RequestsListCubit {
  final RequestsRepository repository;
  final CacheStorage cacheStorage;

  RequestsListCubitImpl({
    required this.repository,
    required this.cacheStorage,
  }) : super();

  @override
  void getRequestsByUserId() async {
    emit(RequestsLoadingState());
    final userId = await cacheStorage.getUserId();
    final data = await repository.getRequests(userId.toString());
    if (data?.object != null) {
      final List<ServiceRequest> result = [];

      data?.object.data.forEach((element) {
        result.add(ServiceRequest.fromJson(element));
      });

      result.sort((a, b) => b.timeCreated!.compareTo(a.timeCreated!));

      emit(RequestsSuccessState(requests: result));
    } else {
      emit(RequestsErrorState(data?.errorMessage));
    }
  }

  @override
  void getStudentRequestsByStatusAndType(String status, String type) async {
    emit(RequestsLoadingState());
    final studentId = await cacheStorage.getUserId();
    final data = await repository.getStudentRequestsByStatusAndType(status, type, studentId.toString());
    if (data?.object != null) {
      final List<ServiceRequest> result = [];

      data?.object.data.forEach((element) {
        result.add(ServiceRequest.fromJson(element));
      });

      result.sort((a, b) => b.timeCreated!.compareTo(a.timeCreated!));

      emit(RequestsSuccessState(requests: result));
    } else {
      emit(RequestsErrorState(data?.errorMessage));
    }
  }

  @override
  void getRequestsByStatusWorkerId(String status) async {
    emit(RequestsLoadingState());
    final workerId = await cacheStorage.getUserId();
    final data = await repository.getRequestsByStatusWorkerId(status, workerId.toString());
    if (data?.object != null) {
      final List<ServiceRequest> result = [];

      data?.object.data.forEach((element) {
        result.add(ServiceRequest.fromJson(element));
      });

      result.sort((a, b) => b.timeCreated!.compareTo(a.timeCreated!));

      emit(RequestsSuccessState(requests: result));
    } else {
      emit(RequestsErrorState(data?.errorMessage));
    }
  }
}
