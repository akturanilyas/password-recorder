import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> passwordPopUp(BuildContext context, {Password? myPassword}) {
  bool isEdit = myPassword == null ? false : true;
  TextEditingController nameController =
      TextEditingController(text: isEdit ? myPassword.name : '');
  TextEditingController passwordController =
      TextEditingController(text: isEdit ? myPassword.password : '');
  TextEditingController descriptionController =
      TextEditingController(text: isEdit ? myPassword.description : '');
  final passwordProvider =
      Provider.of<PasswordProvider>(context, listen: false);
  // ignore: avoid_bool_literals_in_conditional_expressions

  return Alert(
          context: context,
          title: isEdit ? 'Edit Password' : 'Add New Password',
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.text_format),
                  labelText: 'Password name',
                ),
              ),
              TextFormField(
                // initialValue: isEdit ? myPassword.password : '',
                controller: passwordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
              ),
              TextFormField(
                // initialValue: isEdit ? myPassword.description : '',
                controller: descriptionController,
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                if (isEdit) {
                  passwordProvider.editPassword(
                      myPassword.id!,
                      nameController.text,
                      passwordController.text,
                      descriptionController.text);
                } else {
                  passwordProvider.createPassword(nameController.text,
                      passwordController.text, descriptionController.text);
                }
                Navigator.pop(context);
              },
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
          closeIcon: Icon(Icons.close, color: Colors.red[700]))
      .show();
}
