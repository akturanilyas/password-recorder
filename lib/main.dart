import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:password_saver/generated/l10n.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/validation_provider.dart';

import 'package:provider/provider.dart';
import 'src/provider/settings_provider.dart';
import 'src/ui/root.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ValidationProvider()),
      ],
      child: ChangeNotifierProvider<LanguageProvider>(
        create: (context) => LanguageProvider(),
        child: Builder(
          builder: (context) => MaterialApp(
            locale: Provider.of<LanguageProvider>(context, listen: true)
                .currentLocale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Root(),
          ),
        ),
      ),
    );
  }
}
