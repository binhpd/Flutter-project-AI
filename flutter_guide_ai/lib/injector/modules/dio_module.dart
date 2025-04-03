import 'package:dio/dio.dart';
import 'package:flutter_guide_ai/configs/app_config/app_config.dart';
import 'package:flutter_guide_ai/injector/injector.dart';

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
        return handler.next(e);
      },
    ));

    injector.registerSingleton<Dio>(dio, instanceName: dioInstanceName);
  }
}
