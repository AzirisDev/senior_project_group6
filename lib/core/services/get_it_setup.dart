import 'package:senior_project_group6/core/navigation/navigation_service.dart';

import '../globals/constants.dart';

void setup() {
  getIt.registerSingleton<NavigationService>(NavigationService());
}
