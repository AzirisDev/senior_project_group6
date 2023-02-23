import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
