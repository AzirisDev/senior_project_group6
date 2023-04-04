import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/widgets/generals/empty_page.dart';
import 'package:senior_project_group6/features/auth/sign_up/ui/sign_up_page.dart';
import 'package:senior_project_group6/features/auth/login/ui/login_page.dart';

import '../../features/home/ui/home_page.dart';
import 'package:senior_project_group6/features/requests/request_overview/ui/request_overview_page.dart';

class RouterGlobal {
  RouterGlobal._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case 'request_overview':
        return MaterialPageRoute(builder: (_) => const RequestOverviewPage());
      default:
        return MaterialPageRoute(
            builder: (_) => EmptyPage(message: '${settings.name} not found'));
    }
  }
}
