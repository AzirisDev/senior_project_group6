import 'package:flutter/cupertino.dart';
import 'package:senior_project_group6/features/myrequests/ui/my_requests_page.dart';
import 'package:senior_project_group6/features/profile/ui/profile_page.dart';
import 'package:senior_project_group6/features/requests/ui/requests_page.dart';

import '../widgets/generals/empty_page.dart';

class RouterCustom {
  static List<String> pages = ['requests', 'myrequests', 'profile'];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'myrequests':
        // Add new RequestsPage
        return CupertinoPageRoute(
            builder: (_) => const MyRequestsPage(),
            settings: const RouteSettings(name: 'myrequests'));
      case 'requests':
        // Add new RequestsPage
        return CupertinoPageRoute(
            builder: (_) => const RequestsPage(),
            settings: const RouteSettings(name: 'requests'));
      case 'profile':
        // Add new ProfilePage
        return CupertinoPageRoute(
            builder: (_) => const ProfilePage(),
            settings: const RouteSettings(name: 'profile'));
      default:
        return CupertinoPageRoute(
            builder: (_) => EmptyPage(message: '${settings.name} not found'),
            settings: RouteSettings(name: settings.name));
    }
  }
}
