import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  String? _userId;
  String? _userName;

  Future<bool> setUserId(String uId) async {
    final prefs = await SharedPreferences.getInstance();
    _userId = uId;
    return prefs.setString('uId', uId);
  }

  Future<bool> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    _userName = email;
    return prefs.setString('email', email);
  }

  get userId => _userId;
  get userName => _userName;
}
