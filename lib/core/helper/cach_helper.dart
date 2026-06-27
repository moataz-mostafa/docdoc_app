import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future saveToken(String token) async {
    await _pref?.setString('token', token);
  }

  static String? getToken() {
    return _pref?.getString('token');
  }

  static Future clearToken() async {
    await _pref?.remove('token');
  }

  // Remember Me
  static Future saveRememberMe(bool value) async {
    await _pref?.setBool('rememberMe', value);
  }

  static bool getRememberMe() {
    return _pref?.getBool('rememberMe') ?? false;
  }
}