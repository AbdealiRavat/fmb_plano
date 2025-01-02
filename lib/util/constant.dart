import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static String baseURL = 'http://fmbsg.saifysolutions.org/mobile/';
  static String getData = '${baseURL}getdata.aspx?meth=1&companyid=8&sabeelno=';
  static String home = '${baseURL}home.aspx?notab=Y&companyid=8&noheader=Y&sabeelno=';
}

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs;

  /// SET PREFERENCES

  static Future<void> setIntroBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static Future<void> setStringInfo(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static Future<void> setIntegerInfo(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  /// GET PREFERENCES

  static bool getIntroBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static String getStringInfo(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  static int getIntegerInfo(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  /// REMOVE PREFERENCES

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  /// CLEAR PREFERENCES

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
