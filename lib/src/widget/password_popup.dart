import 'package:flutter/material.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
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
  final theme =
      Provider.of<PreferencesProvider>(context, listen: false).getTheme();
  var lang = S.of(context);

  return Alert(
          style: AlertStyle(
            titleStyle: theme.textTheme.bodyText2!,
          ),
          context: context,
          title: isEdit ? lang.editPassword : lang.createPassword,
          content: Column(
            children: <Widget>[
              TextFormField(
                style: theme.textTheme.bodyText2,
                controller: nameController,
                decoration: InputDecoration(
                  labelStyle: theme.textTheme.bodyText2,
                  icon: Icon(Icons.text_format, color: theme.primaryColor),
                  labelText: lang.passwordName,
                ),
              ),
              TextFormField(
                style: theme.textTheme.bodyText2,
                controller: passwordController,
                decoration: InputDecoration(
                  labelStyle: theme.textTheme.bodyText2,
                  icon: Icon(Icons.lock, color: theme.primaryColor),
                  labelText: lang.password,
                ),
              ),
              TextFormField(
                style: theme.textTheme.bodyText2,
                controller: descriptionController,
                decoration: InputDecoration(
                  labelStyle: theme.textTheme.bodyText2,
                  icon: Icon(Icons.description, color: theme.primaryColor),
                  labelText: lang.description,
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              color: theme.primaryColor,
              onPressed: () {
                if (isEdit) {
                  passwordProvider.editPassword(
                      myPassword!.id!,
                      nameController.text,
                      passwordController.text,
                      descriptionController.text);
                } else {
                  passwordProvider.createPassword(
                      nameController.text,
                      passwordController.text,
                      descriptionController.text,
                      lang);
                }
                Navigator.pop(context);
              },
              child: Text(
                isEdit ? lang.edit : lang.create,
                style: TextStyle(color: theme.canvasColor, fontSize: 20),
              ),
            ),
          ],
          closeIcon: Icon(Icons.close, color: Colors.red[700]))
      .show();
}
