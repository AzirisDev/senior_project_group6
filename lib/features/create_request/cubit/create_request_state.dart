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
  final List<Service> services;

  CreateRequestSuccessState({required this.services});

  @override
  List<Object> get props => [services];
}

class CreateRequestErrorState extends CreateRequestState {
  final String errorMessage;

  CreateRequestErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
