import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:password_saver/src/model/request/signup_request_model.dart';
import 'package:password_saver/src/model/user_model.dart';
import 'package:password_saver/src/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late User _user;
  bool isLoggedIn = false;
  SharedPreferences? sharedPreferences;

  User get user => _user;

  Future<void> signIn() async {}
  Future<String> signUp(String username, String email, String password) async {
    SignUpRequest request = SignUpRequest(username, email, password);
    UserRepository userRepository = UserRepository();
    Response response = await userRepository.createUser(request);

    switch (response.statusCode) {
      case 201:
        return 'User successfuly create';
      case 409:
        return 'User already exist';
      default:
        return 'Unexpected error';
    }
  }

  Future<void> signOut() async {}
}
