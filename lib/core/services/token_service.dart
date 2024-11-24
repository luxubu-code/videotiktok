import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = 'token';

  final SharedPreferences _prefs;

  TokenService(this._prefs);

  Future<bool> saveToken(String token) async {
    return await _prefs.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<bool> clearTokens() async {
    return await _prefs.remove(_tokenKey);
  }

  // Kiểm tra đã có token hay chưa
  bool hasToken() {
    return _prefs.getString(_tokenKey) != null;
  }
}
