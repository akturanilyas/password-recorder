import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/welcome_page.dart';
import 'home/home.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    if (authProvider.isLoggedIn) {
      // TODO: Change this a function like Screens
      return const Home();
    } else {
      return WelcomePage();
    }
  }
}
