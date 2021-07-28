import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:password_saver/generated/l10n.dart';

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
    String confirmPassword,
    BuildContext context,
  ) async {
    final lang = S.of(context);
    if (_password != currentPassword) {
      return lang.currentPasswordDoNotMatch;
    } else if (newPassword != confirmPassword) {
      return lang.newPasswordNotmatch;
    } else {
      await setPassword(newPassword);
      return lang.passwordChanged;
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
