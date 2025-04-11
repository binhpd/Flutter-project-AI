import '../../features/auth/bloc/auth_cubit.dart';
import '../../features/register/cubit/register_cubit.dart';
import '../injector.dart';

class BlocModule {
  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<RegisterCubit>(
      () => RegisterCubit(injector()),
    );

    injector.registerFactory<AuthCubit>(
      () => AuthCubit(
        injector(),
        injector(),
      ),
    );
  }
}
