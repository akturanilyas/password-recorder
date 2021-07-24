import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:password_saver/src/model/request/signin_request_model.dart';
import 'package:password_saver/src/model/request/signup_request_model.dart';
import 'package:password_saver/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late User _user;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  User get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  void setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = true;
    prefs.setBool('isLoggedIn', true);
  }
}
