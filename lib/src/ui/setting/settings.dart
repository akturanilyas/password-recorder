import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:password_saver/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  static const String path = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final pref = Provider.of<PreferencesProvider>(context, listen: true);
    final lang = S.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // todo change architecture

          ListTile(
            tileColor: Colors.blue,
            leading: CupertinoSwitch(
              value: pref.getIsDarkTheme(),
              onChanged: (value) {
                pref.changeTheme(value);
              },
            ),
            title: Text(
              lang.theme,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            tileColor: Colors.blue,
            leading: Icon(Icons.language_sharp),
            title: Text(
              lang.language,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            tileColor: Colors.red,
            leading: Icon(Icons.exit_to_app),
            title: Text(lang.exit),
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
