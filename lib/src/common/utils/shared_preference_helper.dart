import 'package:shared_preferences/shared_preferences.dart';
import '../constants/global_variables.dart';
import '../constants/static_data.dart';

class SharedPrefHelper {
  static late SharedPreferences _prefs;

  static getInitialValue() async {
    _prefs = await SharedPreferences.getInstance();
    StaticData.isFirstTime = await getBool(isFirstTimeText) ?? true;
    StaticData.isUser = await getBool(isUserText) ?? true;
    StaticData.isLoggedIn = await getBool(isLoggedInText) ?? false;
    StaticData.email = await getString(emailText) ?? '';
  }

  // Save a string value
  static saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Retrieve a string value
  static getString(String key) async {
    return _prefs.getString(key);
  }

  // Save a boolean value
  static saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  // Retrieve a boolean value
  static getBool(String key) async {
    return _prefs.getBool(key);
  }

  // Save an integer value
  static saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  // Retrieve an integer value
  static getInt(String key) async {
    return _prefs.getInt(key);
  }

  // Save a double value
  static saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  // Retrieve a double value
  static getDouble(String key) async {
    return _prefs.getDouble(key);
  }

  // Remove a value
  static remove(String key) async {
    await _prefs.remove(key);
  }

  // Clear all values
  static clearAll() async {
    await _prefs.clear();
  }
}
