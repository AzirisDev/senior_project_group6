import 'package:flutter/widgets.dart' show NavigatorObserver, Route;

class CustomObserver extends NavigatorObserver {
  Function(Route<dynamic> route, Route<dynamic>? previousRoute)? onPopped;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (onPopped != null) {
      onPopped!(route, previousRoute);
    }
  }
}
