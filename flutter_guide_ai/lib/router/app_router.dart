import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/views/login_screen.dart';
import '../features/register/views/register_screen.dart';
import '../features/welcome/views/welcome_screen.dart';
import '../features/register/cubit/register_cubit.dart';
import '../features/auth/bloc/auth_cubit.dart';
import '../injector/injector.dart';
import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.welcome,
    routes: [
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => Injector.instance<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => Injector.instance<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      // Add other routes here
    ],
  );
}
