import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        appBar: AppBar(
          title: Text(
            lang.account,
            style: theme.textTheme.bodyText1,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _fields(theme, lang),
              _changePassword(context, theme, lang, exPassword, newPassword,
                  confirmPassword)
            ],
          ),
        ),
      ),
    );
  }

  Column _fields(ThemeData theme, S lang) {
    return Column(
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(
                Icons.text_format,
                color: theme.canvasColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: lang.currentPassword,
              labelStyle: theme.textTheme.headline1),
        ),
        SizedBox(
          height: 20,
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(
                Icons.text_format,
                color: theme.canvasColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: lang.newPassword,
              labelStyle: theme.textTheme.headline1),
        ),
        SizedBox(
          height: 20,
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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Icon(
              Icons.text_format,
              color: theme.canvasColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: lang.confirmPassword,
            labelStyle: theme.textTheme.headline1,
          ),
        ),
      ],
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
            MediaQuery.of(context).size.height * .09),
        minimumSize: Size(30, 30),
        backgroundColor: theme.canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
      onPressed: () async {
        String result = await authProvider.checkAndChangePassword(
            currentPassword.text,
            newPassword.text,
            confirmPassword.text,
            context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
            backgroundColor: theme.colorScheme.primary,
          ),
        );
      },
      child: Text(
        lang.create,
        style: theme.textTheme.bodyText1,
      ),
    );
  }
}
