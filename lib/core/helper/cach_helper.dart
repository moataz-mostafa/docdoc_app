import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //================ TOKEN ===================

  static Future saveToken(String token) async {
    await _pref?.setString('token', token);
  }

  static String? getToken() {
    return _pref?.getString('token');
  }

  static Future clearToken() async {
    await _pref?.remove('token');
  }

  //================ USER NAME ===================

  static Future saveUserName(String userName) async {
    await _pref?.setString('userName', userName);
  }

  static String getUserName() {
    return _pref?.getString('userName') ?? "";
  }

  static Future clearUserName() async {
    await _pref?.remove('userName');
  }

  //================ REMEMBER ME ===================

  static Future saveRememberMe(bool value) async {
    await _pref?.setBool('rememberMe', value);
  }

  static bool getRememberMe() {
    return _pref?.getBool('rememberMe') ?? false;
  }

  static Future logout() async {
    await clearToken();
    await clearUserName();
  }
}