import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:password_saver/src/ui/home/home.dart';
import 'package:password_saver/src/ui/loading/loading.dart';
import 'package:password_saver/src/ui/welcome/welcome_page.dart';
import 'package:password_saver/src/widget/lock_widget.dart';
import 'package:provider/provider.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).setStatus();
    Provider.of<PreferencesProvider>(context, listen: false).getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final preferencesProvider =
        Provider.of<PreferencesProvider>(context, listen: true);

    if (authProvider.isLoading || preferencesProvider.isLoading) {
      return LoadingPage();
    } else if (authProvider.isFirstLogin) {
      return WelcomePage();
    } else if (!authProvider.isLoggedIn) {
      return LockScreen();
    } else if (authProvider.isLoggedIn) {
      return Home();
    }
    print('sıkıntı var');
    return WelcomePage();
  }
}
