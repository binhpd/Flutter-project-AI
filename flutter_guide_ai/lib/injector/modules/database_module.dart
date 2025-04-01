import 'package:shared_preferences/shared_preferences.dart';
import '../injector.dart';

class DatabaseModule {
  static Future<void> init() async {
    final injector = Injector.instance;
    final prefs = await SharedPreferences.getInstance();
    injector.registerSingleton<SharedPreferences>(prefs);
  }
} 