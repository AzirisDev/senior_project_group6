import 'package:equatable/equatable.dart';
import 'package:senior_project_group6/features/auth/model/user.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final MainUser user;

  LoginSuccessState({required this.user});

  @override
  List<Object> get props => [];
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LogoutState extends AuthState {
  @override
  List<Object> get props => [];
}
