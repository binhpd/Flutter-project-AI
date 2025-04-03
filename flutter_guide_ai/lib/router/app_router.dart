import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    redirect: (context, state) async {
      return null;
    },
    routes: [],
  );
}
