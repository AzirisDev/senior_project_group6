import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../globals/keys.dart';

import 'package:flutter/widgets.dart' show Route;

class NavigationService extends Cubit<String?> {
  NavigationService() : super('myrequests');

  void navigateTo(String? page, {dynamic arguments, bool forMenu = false}) {
    if (page?.isEmpty ?? true) return;
    Keys.customNavigationKey.currentState!.popUntil((route) {
      if (route.settings.name != page ||
          route.settings.arguments != arguments) {
        switch (page) {
          case 'myrequests':
          case 'requests':
          case 'profile':
          default:
            forMenu
                ? Keys.customNavigationKey.currentState!
                    .pushNamedAndRemoveUntil(page!, (route) => route.isFirst,
                        arguments: arguments)
                : Keys.customNavigationKey.currentState!
                    .pushNamed(page!, arguments: arguments);
        }
        emit(page);
      }
      return true;
    });
  }

  bool pop() {
    if (Keys.customNavigationKey.currentState!.canPop()) {
      Keys.customNavigationKey.currentState!.pop();
      return true;
    }
    return false;
  }

  void popEmit(Route<dynamic>? route, int index) {
    if (route?.settings.name != null ||
        route!.settings.name != null && route.settings.name!.isNotEmpty) {
      String? page = route!.settings.name;
      if (page == 'myrequests') {
        switch (index) {
          case 0:
            page = 'requests';
            break;
          case 2:
            page = 'profile';
        }
      }
      emit(page);
    }
  }
}
