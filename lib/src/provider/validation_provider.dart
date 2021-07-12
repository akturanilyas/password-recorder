import 'package:flutter/material.dart';
import 'package:password_saver/src/constant/constants.dart';
import 'package:password_saver/src/model/form_validation_model.dart';

class ValidationProvider with ChangeNotifier {
  ValidationItem _username = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get username => _username;
  ValidationItem get email => _email;
  ValidationItem get password => _password;

  void setUsername(String username) {
    if (RegExp(ValidationRegEx.username).hasMatch(username)) {
      _username = ValidationItem(username, null);
    } else {
      _username =
          ValidationItem(null, 'Username must contain letters and numbers.');
    }
  }

  void setEmail(String username) {
    //todo we can chance this regex
    if (RegExp(ValidationRegEx.username).hasMatch(username)) {
      _email = ValidationItem(username, null);
    } else {
      _email = ValidationItem(null, 'e-mail must contain letters and numbers.');
    }
    notifyListeners();
  }

  void setPassword(String username) {
    //todo we can chance this regex
    if (RegExp(ValidationRegEx.username).hasMatch(username)) {
      _password = ValidationItem(username, null);
    } else {
      _password =
          ValidationItem(null, 'Password must contain letters and numbers.');
    }
  }
}
