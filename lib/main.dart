import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:password_saver/generated/l10n.dart';
import 'package:password_saver/src/constant/theme.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/navigation.provider.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:password_saver/src/provider/validation_provider.dart';
import 'package:password_saver/src/ui/root.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ValidationProvider()),
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
      ],
      child: ChangeNotifierProvider<PreferencesProvider>(
        create: (context) => PreferencesProvider(
            MyTheme.lightTheme, Locale('en'), 'en', false, 1),
        child: Builder(
          builder: (context) => _materialAppWithTheme(context),
        ),
      ),
    );
  }

  MaterialApp _materialAppWithTheme(BuildContext context) {
    final pref = Provider.of<PreferencesProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFB9C2CA)));
    return MaterialApp(
      locale:
          Provider.of<PreferencesProvider>(context, listen: true).currentLocale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: pref.getTheme(),
      initialRoute: '/',
      onGenerateRoute: NavigationProvider.generateRoute,
      home: const Root(),
    );
  }
}
