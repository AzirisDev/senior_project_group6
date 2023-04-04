import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/features/profile/cubit/profile_state.dart';
import 'package:senior_project_group6/features/profile/model/student.dart';
import 'package:senior_project_group6/features/profile/repositories/profile_repository.dart';

abstract class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(ProfileState state) : super(state);
  void getUser();
}

class ProfileCubitImpl extends ProfileCubit {
  final CacheStorage cacheStorage;
  final ProfileRepository profileRepository;

  ProfileCubitImpl({
    required this.cacheStorage,
    required this.profileRepository,
  }) : super(ProfileState());

  @override
  void getUser() async {
    emit(ProfileLoadingState());
    final data = await cacheStorage.getUserId();
    if (data != null) {
      final userData = await profileRepository.getUser(data.toString());
      if (userData.object != null) {
        emit(ProfileSuccessState(
            student: Student.fromJson(userData.object?.data)));
      } else {
        emit(ProfileErrorState("Login error"));
      }
    } else {
      emit(ProfileErrorState("Login error"));
    }
  }
}
