import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const String path = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.blue,
            leading: Icon(Icons.language_sharp),
            onTap: () async {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            tileColor: Colors.red,
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              await authProvider.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
