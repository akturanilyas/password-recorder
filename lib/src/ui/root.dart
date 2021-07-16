import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/ui/loading/loading.dart';
import 'package:provider/provider.dart';
import 'auth/welcome_page.dart';
import 'home/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  initState() {
    Provider.of<AuthProvider>(context, listen: false).setLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    if (authProvider.isLoggedIn) {
      return LoadingPage();
      //return Home();
    } else {
      return WelcomePage();
    }
  }
}