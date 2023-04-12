import 'package:equatable/equatable.dart';

class RequestStatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestStatusLoadingState extends RequestStatusState {
  @override
  List<Object> get props => [];
}

class RequestStatusSuccessState extends RequestStatusState {
  RequestStatusSuccessState();

  @override
  List<Object> get props => [];
}

class RequestStatusErrorState extends RequestStatusState {
  final String errorMessage;

  RequestStatusErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
