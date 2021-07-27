import 'package:flutter/material.dart';
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
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    if (isPassword == false) {
      return ChangePasswordWidget(
          isConfirmation: false, isPassword: isPassword);
    } else {
      return ChangePasswordWidget(isConfirmation: true, isPassword: isPassword);
    }
  }

  Widget ChangePasswordWidget(
      {required bool isConfirmation, required bool isPassword}) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    String? password = authProvider.password;
    final lang = S.of(context);
    return ScreenLock(
      screenLockConfig: ScreenLockConfig(backgroundColor: theme.canvasColor),
      inputButtonConfig: InputButtonConfig(
        textStyle: TextStyle(color: theme.colorScheme.primary, fontSize: 32),
        buttonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(theme.primaryColor),
        ),
      ),
      title: Text(lang.enterPassword),
      confirmTitle: Text(lang.appPassword),
      correctString: password ?? '',
      // ignore: avoid_bool_literals_in_conditional_expressions
      confirmation: password == null ? true : false,
      didError: (errorCount) {
        // ignore: avoid_print
        print(errorCount);
      },
      didUnlocked: () {},
      didConfirmed: (password) {
        authProvider.setPassword(password);
      },
    );
  }
}
