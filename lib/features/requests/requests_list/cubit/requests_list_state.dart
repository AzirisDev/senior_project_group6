import 'package:equatable/equatable.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';

class RequestsState extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestsLoadingState extends RequestsState {
  @override
  List<Object> get props => [];
}

class RequestsSuccessState extends RequestsState {
  final List<ServiceRequest> requests;

  RequestsSuccessState({required this.requests});

  @override
  List<Object> get props => [];
}

class RequestsErrorState extends RequestsState {
  final String errorMessage;

  RequestsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
