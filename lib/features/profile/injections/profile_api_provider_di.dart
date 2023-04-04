import 'package:senior_project_group6/features/profile/providers/profile_api_provider.dart';

class ProfileApiProviderInject {
  static ProfileApiProvider? _profileApiProvider;

  ProfileApiProviderInject._();

  static ProfileApiProvider? profileApiProvider() {
    _profileApiProvider ??= ProfileApiProviderImpl();
    return _profileApiProvider;
  }
}
