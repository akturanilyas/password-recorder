import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/model/request/edit_password_request_model.dart';
import 'package:password_saver/src/model/request/password_request_model.dart';
import 'package:password_saver/src/utils/database_helper.dart';

class PasswordProvider with ChangeNotifier {
  List<Password> _myPasswords = [];
  bool _isLoading = false;
  DBProvider db = DBProvider();

  List<Password> get myPasswords => _myPasswords;
  bool get isLoading => _isLoading;

  Future<void> getMyPasswords() async {
    _isLoading = true;
    _myPasswords = await db.getAllPassword();
    // TODO Get all password
    _isLoading = false;
    notifyListeners();
  }

  Future<String> createPassword(
      String name, String password, String description) async {
    PasswordRequest request = PasswordRequest(name, password, description);

    await db.createPassword(request);
    // TODO Create Password
    //todo Add: Handler
    getMyPasswords();
    return 'text';
  }

  Future<String> editPassword(
      String id, String name, String password, String description) async {
    EditPasswordRequest request =
        EditPasswordRequest(id, name, password, description);
    // TODO Update password

    getMyPasswords();
    notifyListeners();
    return 'text';
  }

  Future<String> deletePassword(String id) async {
    // TODO delete password

    // if (status == true) {
    //   // ignore: avoid_bool_literals_in_conditional_expressions
    //   myPasswords.removeWhere((password) => id == password.id ? true : false);
    //   notifyListeners();
    //   return 'Password succesfully deleted';
    // }
    return "Password can't be deleted.";
  }
}
