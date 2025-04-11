import 'package:rest_client/rest_client.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/register/register_repository.dart';
import '../injector.dart';
import 'dio_module.dart';

class RepositoryModule {
  static void init() {
    final injector = Injector.instance;
    
    injector.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(injector<RegisterApi>()),
    );

    injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector<AuthApi>()),
    );
  }
}
