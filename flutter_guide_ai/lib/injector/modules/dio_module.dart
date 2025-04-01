import 'package:dio/dio.dart';
import 'package:flutter_guide_ai/configs/app_config/app_config.dart';
import 'package:flutter_guide_ai/injector/injector.dart';
import 'package:flutter_guide_ai/router/app_router.dart';
import 'package:flutter_guide_ai/services/auth_service/auth_service.dart';
import 'package:go_router/go_router.dart';

class DioModule {
  static const String dioInstanceName = 'dio';

  static void init() {
    final injector = Injector.instance;
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: AppConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // TODO: Add token to header
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          final authService = injector<AuthService>();
          await authService.clearAuth();

          if (navigatorKey.currentContext != null) {
            navigatorKey.currentContext!.go('/login');
          }
        }
        return handler.next(e);
      },
    ));

    injector.registerSingleton<Dio>(dio, instanceName: dioInstanceName);
  }
}
