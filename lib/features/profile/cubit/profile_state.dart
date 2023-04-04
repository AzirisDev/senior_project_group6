import 'package:equatable/equatable.dart';
import 'package:senior_project_group6/features/profile/model/student.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccessState extends ProfileState {
  final Student student;

  ProfileSuccessState({required this.student});

  @override
  List<Object> get props => [];
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  ProfileErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
