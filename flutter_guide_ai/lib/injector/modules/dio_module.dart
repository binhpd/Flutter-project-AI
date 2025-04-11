import 'package:dio/dio.dart';
import 'package:flutter_guide_ai/configs/app_config/app_config.dart';
import 'package:flutter_guide_ai/core/network/logging_interceptor.dart';
import 'package:flutter_guide_ai/injector/injector.dart';
import 'package:flutter_guide_ai/services/auth/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

    // Add logging interceptor
    dio.interceptors.add(LoggingInterceptor());

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final storage = injector<FlutterSecureStorage>();
        final token = await storage.read(key: 'auth_token');
        
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Token expired or invalid
          final authService = injector<AuthService>();
          await authService.clearAuth();
          // You can also implement token refresh here if needed
        }
        return handler.next(e);
      },
    ));

    injector.registerSingleton<Dio>(dio, instanceName: dioInstanceName);
  }
}
