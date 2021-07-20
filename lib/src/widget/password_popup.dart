import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:password_saver/generated/l10n.dart';

Future<bool?> passwordPopUp(BuildContext context, {Password? myPassword}) {
  bool isEdit;
  if (myPassword == null) {
    isEdit = false;
  } else {
    isEdit = true;
  }
  TextEditingController nameController =
      TextEditingController(text: isEdit ? myPassword!.name : '');
  TextEditingController passwordController =
      TextEditingController(text: isEdit ? myPassword!.password : '');
  TextEditingController descriptionController =
      TextEditingController(text: isEdit ? myPassword!.description : '');
  final passwordProvider =
      Provider.of<PasswordProvider>(context, listen: false);
  var lang = S.of(context);

  return Alert(
          context: context,
          title: isEdit ? lang.editPassword : lang.createPassword,
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.text_format),
                  labelText: lang.passwordName,
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: lang.password,
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: lang.description,
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                if (isEdit) {
                  passwordProvider.editPassword(
                      myPassword!.id!,
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
                isEdit ? lang.edit : lang.create,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
          closeIcon: Icon(Icons.close, color: Colors.red[700]))
      .show();
}
