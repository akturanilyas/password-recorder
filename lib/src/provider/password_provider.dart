import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/model/request/edit_password_request_model.dart';
import 'package:password_saver/src/model/request/password_request_model.dart';
import 'package:password_saver/src/repository/password_repository.dart';

class PasswordProvider with ChangeNotifier {
  List<Password> _myPasswords = [];
  PasswordRepository passwordRepository = PasswordRepository();
  bool _isLoading = false;

  List<Password> get myPasswords => _myPasswords;
  bool get isLoading => _isLoading;

  Future<void> getMyPasswords() async {
    _isLoading = true;
    _myPasswords = await passwordRepository.getAllPassword();
    _isLoading = false;
    notifyListeners();
  }

  Future<String> createPassword(
      String name, String password, String description) async {
    PasswordRequest request = PasswordRequest(name, password, description);

    await passwordRepository.createPassword(request);
    //todo Add: Handler
    getMyPasswords();
    return 'text';
  }

  Future<String> editPassword(
      String id, String name, String password, String description) async {
    EditPasswordRequest request =
        EditPasswordRequest(id, name, password, description);
    await passwordRepository.editPassword(request);

    getMyPasswords();
    notifyListeners();
    return 'text';
  }

  Future<String> deletePassword(String id) async {
    bool status = await passwordRepository.deletePassword(id);

    if (status == true) {
      // ignore: avoid_bool_literals_in_conditional_expressions
      myPasswords.removeWhere((password) => id == password.id ? true : false);
      notifyListeners();
      return 'Password succesfully deleted';
    }
    return "Password can't be deleted.";
  }
}
