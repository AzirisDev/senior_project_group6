import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/models/data_response.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_state.dart';

abstract class RequestStatusCubit extends Cubit<RequestStatusState> {
  RequestStatusCubit() : super(RequestStatusState());
  void changeRequestStatus({
    required String requestId,
    required String status,
  });
}

class RequestStatusCubitImpl extends RequestStatusCubit {
  final RequestsRepository repository;

  RequestStatusCubitImpl({
    required this.repository,
  }) : super();

  @override
  void changeRequestStatus({required String requestId, required String status}) async {
    emit(RequestStatusLoadingState());
    final data = await repository.changeStatus(requestId, status);
    if (data?.object != null) {
      String status = (data?.object as DataResponse).status.toString();
      if (status.toLowerCase() == 'ok') {
        emit(RequestStatusSuccessState());
      } else {
        emit(RequestStatusErrorState(data?.errorMessage));
      }
    } else {
      emit(RequestStatusErrorState(data?.errorMessage));
    }
  }
}
