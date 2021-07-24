import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isLoggedIn') == true) {
      _isLoggedIn = true;
      prefs.setBool('isLoggedIn', true);
    }
  }

  Future<void> setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _isLoggedIn = true;
    prefs.setBool('isLoggedIn', true);

    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    print(prefs.getBool('isLoggedIn'));
    _isLoggedIn = false;
    notifyListeners();
  }
}
