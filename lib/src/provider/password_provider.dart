import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/model/request/password_request_model.dart';
import 'package:password_saver/src/repository/password_repository.dart';

class PasswordProvider with ChangeNotifier {
  List<Password> _myPasswords = [];
  PasswordRepository passwordRepository = PasswordRepository();

  List<Password> get myPasswords => _myPasswords;

  Future<void> setMyPasswords() async {}

  Future<String> createPassword(
      String name, String password, String description) async {
    PasswordRequest request = PasswordRequest(name, password, description);

    await passwordRepository.createPassword(request);
    return 'text';
  }
}
