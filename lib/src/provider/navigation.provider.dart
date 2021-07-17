import 'package:flutter/material.dart';
import 'package:password_saver/src/ui/auth/signin_page.dart';
import 'package:password_saver/src/ui/auth/signup_page.dart';
import 'package:password_saver/src/ui/auth/welcome_page.dart';
import 'package:password_saver/src/ui/not_found/not_found.dart';
import 'package:password_saver/src/ui/root.dart';
import 'package:password_saver/src/ui/setting/setting.dart';

class NavigationProvider with ChangeNotifier {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    print('Pushed ${settings.name}');
    switch (settings.name) {
      case Root.path:
        return MaterialPageRoute(builder: (_) => Root());
      case LoginPage.path:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case SignUpPage.path:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case WelcomePage.path:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case Settings.path:
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
