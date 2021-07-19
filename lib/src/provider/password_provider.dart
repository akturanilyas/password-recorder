import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
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

  Future<String> deletePassword(String id) async {
    bool status = await passwordRepository.deletePassword(id);

    if (status == true) {
      myPasswords.removeWhere((element) => id == element.id ? true : false);
      notifyListeners();
      return 'Password';
    }
    return "Password can't be deleted.";
  }
}
