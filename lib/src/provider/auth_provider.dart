import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  bool _isFirstLogin = false;
  String? _password;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  bool get isFirstLogin => _isFirstLogin;
  String? get password => _password;

  Future<String> checkAndChangePassword(
    String currentPassword,
    String newPassword,
    confirmPassword,
  ) async {
    if (_password != currentPassword) {
      print('şifreler uyuşmay');
      return 'şifreler uyuşmmuyor';
    } else if (newPassword != confirmPassword) {
      print('yeni şifreler uyuşmay');
      return 'Yeni şifreler uyuşmuyor';
    } else {
      await setPassword(newPassword);
      print('başarılı');
      return 'başarılı';
    }
  }

  Future<void> changeFirstLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isFirstLogin', value);
    _isFirstLogin = value;

    notifyListeners();
  }

  Future<void> setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isFirstLogin') == null ||
        prefs.getBool('isFirstLogin') == true) {
      changeFirstLogin(true);
    } else {
      changeFirstLogin(false);
    }
    _password = prefs.getString('password');

    notifyListeners();
  }

  Future<void> setPassword(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('password', value);
    _password = value;
    _isLoggedIn = true;

    notifyListeners();
  }

  Future<void> setLoggedIn() async {
    _isLoggedIn = true;

    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await changeFirstLogin(true);
    _isLoggedIn = false;
    await prefs.clear();

    notifyListeners();
  }
}
