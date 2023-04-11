import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_state.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';
import 'package:senior_project_group6/features/requests/common/repositories/requests_repository.dart';

abstract class CreateRequestCubit extends Cubit<CreateRequestState> {
  CreateRequestCubit(CreateRequestState state) : super(state);
  void getServices();
}

class CreateRequestCubitImpl extends CreateRequestCubit {
  final RequestsRepository repository;

  CreateRequestCubitImpl({
    required this.repository,
  }) : super(CreateRequestState());

  @override
  void getServices() async {
    emit(CreateRequestLoadingState());

    final data = await repository.getServices();
    if (data?.object != null) {
      final List<Service> result = [];

      data?.object.data.forEach((element) {
        result.add(Service.fromJson(element));
      });

      emit(CreateRequestSuccessState(services: result));
    } else {
      emit(CreateRequestErrorState(data?.errorMessage));
    }
  }
}
