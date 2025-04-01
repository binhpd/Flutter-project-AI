import 'package:flutter/material.dart';
import 'package:flutter_guide_ai/services/auth_service/auth_service.dart';
import 'package:go_router/go_router.dart';

import '../injector/injector.dart';
import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    redirect: (context, state) async {
      final authService = Injector.instance<AuthService>();
      final isAuthenticated = await authService.isAuthenticated();
      final isAuthRoute = state.matchedLocation == Routes.login;

      if (!isAuthenticated && !isAuthRoute) {
        return Routes.login;
      }

      if (isAuthenticated && isAuthRoute) {
        return Routes.home;
      }

      return null;
    },
    routes: [],
  );
}
