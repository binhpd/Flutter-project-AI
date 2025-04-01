import 'package:get_it/get_it.dart';

import 'modules/bloc_module.dart';
import 'modules/database_module.dart';
import 'modules/dio_module.dart';
import 'modules/repository_module.dart';
import 'modules/rest_client_module.dart';
import 'modules/service_module.dart';

class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static Future<void> init() async {
    await DatabaseModule.init();
    DioModule.init();
    RepositoryModule.init();
    RestClientModule.init();
    ServiceModule.init();
    BlocModule.init();
  }
}
