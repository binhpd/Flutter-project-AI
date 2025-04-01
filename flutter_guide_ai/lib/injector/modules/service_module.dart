import 'package:flutter_guide_ai/services/auth_service/auth_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/analytics_service/analytics_service.dart';
import '../../services/analytics_service/analytics_service_impl.dart';
import '../../services/auth_service/auth_service.dart';
import '../../services/storage_service/storage_service.dart';
import '../../services/storage_service/storage_service_impl.dart';
import '../injector.dart';

class ServiceModule {
  static void init() {
    final injector = Injector.instance;

    // Register Auth Service
    injector.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(),
    );

    // Register Storage Service
    injector.registerLazySingleton<StorageService>(
      () => StorageServiceImpl(injector<SharedPreferences>()),
    );

    // Register Analytics Service
    injector.registerLazySingleton<AnalyticsService>(
      () => AnalyticsServiceImpl(),
    );
  }
}
