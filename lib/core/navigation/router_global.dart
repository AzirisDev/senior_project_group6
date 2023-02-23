import 'package:flutter/material.dart';
import 'package:senior_project_group6/features/auth/sign_up/ui/sign_up_page.dart';
import 'package:senior_project_group6/features/auth/login/ui/login_page.dart';

import '../../features/home/ui/home_page.dart';
import '../../features/splash/splash_page_view.dart';
import '../widgets/generals/empty_page.dart';

class RouterGlobal {
  RouterGlobal._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => const SplashPageView());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'myrequests':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      default:
        return MaterialPageRoute(
            builder: (_) => EmptyPage(message: '${settings.name} not found'));
    }
  }
}
