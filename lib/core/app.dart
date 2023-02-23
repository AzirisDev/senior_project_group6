import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/splash/splash_page.dart';
import 'globals/constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    //register all necessary getIts
  }

  @override
  void dispose() {
    super.dispose();
    //delete all unnecessary dynamic caches etc
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: themeState.theme.themeData,
        home: SplashPage(),
      ),
    );
  }
}
