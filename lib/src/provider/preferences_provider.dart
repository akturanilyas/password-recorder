import 'package:flutter/material.dart';
import 'package:password_saver/src/constant/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  ThemeData _themeData;
  Locale _currentLocale;
  String _lang;
  bool _isDarkTheme;
  PreferencesProvider(
      this._themeData, this._currentLocale, this._lang, this._isDarkTheme);

  ThemeData getTheme() => _themeData;
  bool getIsDarkTheme() => _isDarkTheme;
  Locale get currentLocale => _currentLocale;
  String get lang => _lang;

  // void setDefaultTheme() {
  //   _themeData = ThemeData.light();
  // }

  // void setTheme(ThemeData theme) {
  //   _themeData = theme;
  //   notifyListeners();
  // }

  Future<void> changeTheme({required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = value;
    _themeData = _isDarkTheme ? MyTheme.darkTheme : MyTheme.lightTheme;
    prefs.setBool('isDarkTheme', _isDarkTheme);
    notifyListeners();
  }

  Future<void> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    _themeData = _isDarkTheme ? MyTheme.darkTheme : MyTheme.lightTheme;
    _lang = prefs.getString('language') ?? 'en';
    changeLocale(prefs.getString('language') ?? 'en');
    notifyListeners();
  }

  Future<void> changeLocale(String _locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _lang = _locale;
    _currentLocale = Locale(_locale);
    await prefs.setString('language', _locale);
    notifyListeners();
  }
}
