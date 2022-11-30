import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/navigation/navigation_service.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

import '../../../core/globals/keys.dart';
import '../../../core/navigation/custom_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/navigation/router_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> _tabCaption = ['Requests', 'My Requests', 'Profile'];
  final List<Widget> _tabIcon = [
    const Icon(Icons.remove_red_eye),
    const Icon(Icons.table_chart),
    const Icon(Icons.person)
  ];

  final List<String?> _tabNavigation = ['requests', 'myrequests', 'profile'];
  TabController? _tabController;
  CustomObserver? _customObserver;
  final GlobalKey<ScaffoldState> drawerScaffoldKey = GlobalKey();
  bool drawerIconSwitch = true;
  bool hideIconArrow = false;
  bool hideMenuIcon = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: _tabNavigation.length, initialIndex: 1);
    BlocProvider.of<NavigationService>(context).stream.listen((state) {
      if (_tabNavigation.contains(state)) {
        _tabController!.animateTo(_tabNavigation.indexOf(state),
            duration: const Duration(seconds: 1));
      }
    });

    _customObserver = CustomObserver()
      ..onPopped = (route, previousRoute) {
        BlocProvider.of<NavigationService>(context)
            .popEmit(previousRoute, _tabController!.index);
      };
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  // void _navigation(String viewref, {bool logout = false}) {
  //   if (viewref.isEmpty) return;
  //   if (!logout) {
  //     final navigateToPage = RouterCustom.pages.contains(viewref);
  //     BlocProvider.of<NavigationService>(context).navigateTo(
  //         navigateToPage ? viewref : 'views',
  //         arguments: navigateToPage ? null : viewref,
  //         forMenu: true);
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Navigator(
              key: Keys.customNavigationKey,
              initialRoute: 'myrequests',
              onGenerateInitialRoutes: (navigator, initialRoute) {
                return [
                  navigator.widget.onGenerateRoute!(RouteSettings(
                      name: 'myrequests', arguments: _tabController))!
                ];
              },
              onGenerateRoute: RouterCustom.generateRoute,
              observers: [
                HeroController(),
                _customObserver!,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        key: Keys.bottomBar,
        decoration: const BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1.0,
              spreadRadius: 0.1,
            )
          ],
        ),
        child: SafeArea(
          child: TabBar(
            onTap: (tab) {
              BlocProvider.of<NavigationService>(context)
                  .navigateTo(_tabNavigation[tab]);
            },
            controller: _tabController,
            tabs: List.generate(3, (index) {
              return Tab(
                icon: _tabIcon[index],
                text: _tabCaption[index],
              );
            }),
            labelPadding: const EdgeInsets.only(bottom: 0),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: AppColor.grey,
            labelColor: AppColor.primaryBlue,
            indicator: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
