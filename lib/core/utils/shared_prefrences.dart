import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);
    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static dynamic removeData({required String key}) {
    return sharedPreferences?.remove(key);
  }
}
