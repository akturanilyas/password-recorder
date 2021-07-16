import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> addPassword(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final passwordProvider =
      Provider.of<PasswordProvider>(context, listen: false);

  return Alert(
      context: context,
      title: 'LOGIN',
      content: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              icon: Icon(Icons.text_format),
              labelText: 'Password name',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
          ),
          TextField(
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
          onPressed: () => {
            passwordProvider.createPassword(nameController.text,
                passwordController.text, descriptionController.text),
            //todo:
            //Navigator.pop(context)
          },
          child: Text(
            'Create',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
