import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/widget/password_popup.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:password_saver/generated/l10n.dart';

Slidable passwordTile(Password myPassword, BuildContext context) {
  final passwordProvider = Provider.of<PasswordProvider>(context, listen: true);
  var lang = S.of(context);
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actions: <Widget>[
      IconSlideAction(
        caption: lang.edit,
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          passwordPopUp(context, myPassword: myPassword);
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: lang.delete,
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => {passwordProvider.deletePassword(myPassword.id!)},
      ),
    ],
    child: Container(
      color: Colors.white,
      child: ListTile(
        onTap: () => {
          Alert(
              context: context,
              title: myPassword.name!,
              content: Column(
                children: [
                  //_formField(Icons.lock, myPassword.password!),
                  _formField(Icons.lock, myPassword.password!),
                  _formField(Icons.description, myPassword.description!)
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: null,
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show()
        },
        title: Text(myPassword.name!),
        subtitle: Text(myPassword.description!),
      ),
    ),
  );
}

Row _formField(IconData icon, String text) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: TextEditingController(text: text),
          readOnly: true,
          enabled: false,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            icon: Icon(icon),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: text));
        },
        icon: Icon(Icons.copy),
        color: Colors.blue,
      ),
    ],
  );
}
