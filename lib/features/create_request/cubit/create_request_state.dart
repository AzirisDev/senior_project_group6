import 'package:equatable/equatable.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';

class CreateRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateRequestLoadingState extends CreateRequestState {
  @override
  List<Object> get props => [];
}

class CreateRequestSuccessState extends CreateRequestState {
  CreateRequestSuccessState();

  @override
  List<Object> get props => [];
}

class CreateRequestErrorState extends CreateRequestState {
  final String errorMessage;

  CreateRequestErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class GetServicesSuccessState extends CreateRequestState {
  final List<Service> services;

  GetServicesSuccessState({required this.services});

  @override
  List<Object> get props => [services];
}

class GetServicesLoadingState extends CreateRequestState {
  @override
  List<Object> get props => [];
}

class GetServicesErrorState extends CreateRequestState {
  final String errorMessage;

  GetServicesErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
