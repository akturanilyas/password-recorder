import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/configurations/input_button_config.dart';
import 'package:flutter_screen_lock/configurations/screen_lock_config.dart';
import 'package:flutter_screen_lock/screen_lock.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:password_saver/generated/l10n.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      canCancel: false,
      correctString: password ?? '',
      // ignore: avoid_bool_literals_in_conditional_expressions
      confirmation: password == null ? true : false,
      didError: (errorCount) {
        // ignore: avoid_print
        print(errorCount);
      },
      didUnlocked: () async {
        await authProvider.setLoggedIn();
        // ignore: avoid_print
        print('logout');
      },
      didConfirmed: (password) async {
        await authProvider.setPassword(password);
      },
    );
  }
}
