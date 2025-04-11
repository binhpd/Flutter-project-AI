import 'package:dio/dio.dart';
import 'package:rest_client/rest_client.dart';
import '../injector.dart';
import 'dio_module.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<RegisterApi>(
      () => RegisterApi(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );

    injector.registerFactory<AuthApi>(
      () => AuthApi(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}
