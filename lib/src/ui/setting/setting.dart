import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const String path = '/settings';
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        tileColor: Colors.red,
        leading: Icon(Icons.exit_to_app),
        onTap: () async {
          await authProvider.signOut();
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome', (route) => false);
        },
      ),
    );
  }
}
