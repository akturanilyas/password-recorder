import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/configurations/input_button_config.dart';
import 'package:flutter_screen_lock/configurations/screen_lock_config.dart';
import 'package:flutter_screen_lock/screen_lock.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:password_saver/generated/l10n.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String path = '/account';

  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void dispose() {
    //TODO dispose
    super.dispose();
  }

  TextEditingController exPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: theme.textTheme.headline1,
              cursorColor: theme.canvasColor,
              controller: exPassword,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.text_format,
                    color: theme.canvasColor,
                  ),
                  labelText: lang.currentPassword,
                  labelStyle: theme.textTheme.headline1),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              cursorColor: theme.canvasColor,
              style: theme.textTheme.headline1,
              controller: newPassword,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: theme.canvasColor,
                  ),
                  labelText: lang.newPassword,
                  labelStyle: theme.textTheme.headline1),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: theme.textTheme.headline1,
              cursorColor: theme.textTheme.headline1!.color,
              controller: confirmPassword,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.description,
                  color: theme.canvasColor,
                ),
                labelText: lang.confirmPassword,
                labelStyle: theme.textTheme.headline1,
              ),
            ),
            _changePassword(
                context, theme, lang, exPassword, newPassword, confirmPassword)
          ],
        ),
      ),
    );
  }

  TextButton _changePassword(
    BuildContext context,
    ThemeData theme,
    S lang,
    TextEditingController currentPassword,
    TextEditingController newPassword,
    TextEditingController confirmPassword,
  ) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .1),
        minimumSize: Size(30, 30),
        backgroundColor: theme.canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
      onPressed: () async {
        await authProvider.checkAndChangePassword(
            currentPassword.text, newPassword.text, confirmPassword.text);
      },
      child: Text(
        lang.create,
        style: theme.textTheme.bodyText1,
      ),
    );
  }
}
