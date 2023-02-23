import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/features/myrequests/ui/my_requests_page.dart';
import 'package:senior_project_group6/features/profile/ui/profile_page.dart';
import 'package:senior_project_group6/features/requests/ui/requests_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = const [
    RequestsPage(),
    ProfilePage(),
    MyRequestsPage(),
  ];

  final iconList = [
    Icons.remove_red_eye,
    Icons.person,
  ];
  Widget _page = const MyRequestsPage();
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryBlue,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: const Icon(Icons.bar_chart),
      ),
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
      body: _children[_currentIndex],
    );
  }

  final _items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.remove_red_eye), label: "Requests"),
    BottomNavigationBarItem(
      icon: Icon(Icons.table_chart),
      label: "My Requests",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];
}
