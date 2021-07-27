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
    final authProvider = Provider.of<AuthProvider>(context);
    final pref = Provider.of<PreferencesProvider>(context);
    final lang = S.of(context);
    final theme = Provider.of<PreferencesProvider>(context).getTheme();

    List<ListTile> tiles = [
      ListTile(
        leading: Icon(Icons.dark_mode, color: theme.primaryColor),
        trailing: CupertinoSwitch(
          trackColor: theme.primaryColor,
          value: pref.getIsDarkTheme(),
          onChanged: (value) {
            pref.changeTheme(value: value);
          },
        ),
        title: Text(
          lang.theme,
          style: TextStyle(color: theme.primaryColor),
        ),
      ),
      ListTile(
        leading: Icon(Icons.language_sharp, color: theme.primaryColor),
        title: Text(
          lang.language,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () async {
          Navigator.pushNamed(context, '/language');
        },
      ),
      ListTile(
        leading: Icon(Icons.account_circle, color: theme.primaryColor),
        title: Text(
          lang.account,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () async {
          Navigator.pushNamed(context, '/account');
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: theme.textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: tiles.length,
          itemBuilder: (context, index) {
            return Card(
              color: index == 3 ? theme.errorColor : theme.canvasColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: tiles[index],
            );
          },
        ),
      ),
    );
  }
}
