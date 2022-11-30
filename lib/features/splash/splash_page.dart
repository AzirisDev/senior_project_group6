import 'package:flutter/material.dart';

import '../../core/globals/keys.dart';
import '../../core/navigation/router_global.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // register multi bloc provider

    return Navigator(
      key: Keys.globalNavigationKey,
      initialRoute: 'splash',
      onGenerateRoute: RouterGlobal.generateRoute,
    );
  }
}
