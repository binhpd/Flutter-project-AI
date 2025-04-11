import 'package:flutter_guide_ai/injector/injector.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth/auth_service.dart';

class ServiceModule {
  static void init() {
    final injector = Injector.instance;

    injector.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

    injector.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(
        injector<FlutterSecureStorage>(),
        injector<SharedPreferences>(),
      ),
    );
  }
}
