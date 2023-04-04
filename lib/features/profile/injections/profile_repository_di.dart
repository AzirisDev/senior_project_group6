import 'package:senior_project_group6/features/profile/injections/profile_api_provider_di.dart';

import '../repositories/profile_repository.dart';

class ProfileRepositoryInject {
  static ProfileRepository? _profileRepository;

  ProfileRepositoryInject._();

  static ProfileRepository? profileRepository() {
    _profileRepository ??= ProfileRepositoryImpl(
      apiProvider: ProfileApiProviderInject.profileApiProvider()!,
    );
    return _profileRepository;
  }
}
