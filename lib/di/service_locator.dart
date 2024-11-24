import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videotiktok/core/services/token_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Đăng ký SharedPreferences như một singleton
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPreferences>(prefs);

  locator.registerLazySingleton<TokenService>(
      () => TokenService(locator<SharedPreferences>()));
}
