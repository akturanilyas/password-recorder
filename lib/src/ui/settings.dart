import 'package:flutter/material.dart';
import 'package:password_saver/generated/l10n.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    var languageProvider =
        Provider.of<PreferencesProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).welcomeText),
          actions: [],
        ),
        body: Text(S.of(context).selectLanguage),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            context.read<PreferencesProvider>().changeLocale('tr'),
            print('bastım'),
          },
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
