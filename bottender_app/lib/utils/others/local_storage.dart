import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _prefix = 'bottender_app_';

  static Future<void> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_prefix$key', value);
  }

  static Future<String?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('$_prefix$key');
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_prefix$key');
  }
}
