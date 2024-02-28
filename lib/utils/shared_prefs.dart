import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  bool get themeMode => _sharedPrefs.getBool(themeModeKey) ?? true;

  set themeMode(bool mode) {
    _sharedPrefs.setBool(themeModeKey, mode);
  }
}
final sharedPrefs = SharedPrefs();

const String themeModeKey = "theme_mode";