import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  Locale _currentLocale = Locale('en');
  String _lang = '';
  Locale get currentLocale => _currentLocale;
  String get lang => _lang;

  Future<void> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
