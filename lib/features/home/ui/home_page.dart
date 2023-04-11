import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/features/create_request/ui/create_request_page.dart';
import 'package:senior_project_group6/features/profile/ui/profile_page.dart';
import 'package:senior_project_group6/features/requests/requests_list/ui/requests_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWorker = false;
  List<Widget> children = [
    const RequestsListPage(),
    const ProfilePage(),
    const CreateRequestsPage(),
  ];
  @override
  void initState() {
    super.initState();
    getWorker();
  }

  void getWorker() async {
    var role = await CacheStorage().getUserRole();
    if (role.toString().toLowerCase() == "worker") {
      isWorker = true;
      setState(() {});
    }
  }

  final iconList = [
    Icons.list,
    Icons.person,
  ];
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: isWorker ? null : FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !isWorker && _currentIndex != 2
          ? FloatingActionButton(
              backgroundColor: AppColor.primaryBlue,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeColor: AppColor.primaryBlue,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      body: children[_currentIndex],
    );
  }
}
