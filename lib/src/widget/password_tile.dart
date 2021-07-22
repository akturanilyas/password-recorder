import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:password_saver/src/widget/password_popup.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:password_saver/generated/l10n.dart';

Slidable passwordTile(Password myPassword, BuildContext context) {
  final passwordProvider = Provider.of<PasswordProvider>(context, listen: true);
  final theme =
      Provider.of<PreferencesProvider>(context, listen: true).getTheme();
  var lang = S.of(context);
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actions: <Widget>[
      IconSlideAction(
        caption: lang.edit,
        color: Colors.yellow,
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
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: ListTile(
        onTap: () => {
          Alert(
            style: AlertStyle(
              titleStyle: theme.dialogTheme.titleTextStyle!,
              isButtonVisible: false,
            ),
            closeIcon: Icon(Icons.close, color: theme.primaryColor),
            context: context,
            title: myPassword.name!,
            content: Column(
              children: [
                //todo add another field
                //_formField(Icons.lock, myPassword.password!),
                _formField(Icons.lock, myPassword.password!, theme),
                _formField(Icons.description, myPassword.description!, theme)
              ],
            ),
          ).show()
        },
        title: Text(
          myPassword.name!,
          style: theme.textTheme.bodyText1,
        ),
        subtitle:
            Text(myPassword.description!, style: theme.textTheme.bodyText2),
      ),
    ),
  );
}

Row _formField(IconData icon, String text, ThemeData theme) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: TextEditingController(text: text),
          readOnly: true,
          enabled: false,
          minLines: 1,
          maxLines: 3,
          style: theme.textTheme.bodyText2,
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
        color: theme.primaryColor,
      ),
    ],
  );
}
