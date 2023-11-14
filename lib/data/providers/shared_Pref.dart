import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<String> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('access_token') ?? '';
  }

  Future setToken(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('access_token', value);
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  Future<bool> isUserSignedIn() async {
    var user = await getToken();
    if (user != '') {
      return true;
    } else {
      return false;
    }
  }
}
