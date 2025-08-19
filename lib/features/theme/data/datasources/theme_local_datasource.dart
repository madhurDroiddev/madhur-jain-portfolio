import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<bool> getTheme();
  Future<void> setTheme(bool isDarkMode);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  static const String _themeKey = 'theme_mode';

  @override
  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  @override
  Future<void> setTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode);
  }
}
