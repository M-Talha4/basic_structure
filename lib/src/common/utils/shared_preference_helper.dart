import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_variables.dart';
import '../constants/static_data.dart';

class SharedPrefHelper {
  // Singleton instance
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() {
    return _instance;
  }

  SharedPrefHelper._internal();
  Future<void> getInitialValue() async {
    StaticData.isFirstTime = await getBool(isFirstTimeText) ?? true;
    StaticData.isUser = await getBool(isUserText) ?? true;
    StaticData.isAdmin = await getBool(isAdminText) ?? false;
    StaticData.isLoggedIn = await getBool(isLoggedInText) ?? false;

    StaticData.email = await getString(emailText) ?? '';
    StaticData.password = await getString(passwordText) ?? '';
  }

  // Save a string value
  Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Retrieve a string value
  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // Retrieve a boolean value
  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // Save an integer value
  Future<void> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // Retrieve an integer value
  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // Save a double value
  Future<void> saveDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  // Retrieve a double value
  Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  // Remove a value
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Clear all values
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
