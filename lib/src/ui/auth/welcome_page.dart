import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:password_saver/generated/l10n.dart';
import 'package:password_saver/src/constant/language.dart';
import 'package:password_saver/src/model/language_model.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const String path = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<PreferencesProvider>(context, listen: true);
    final auth = Provider.of<AuthProvider>(context, listen: true);
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    final lang = S.of(context);
    List<PageViewModel> pages = [
      PageViewModel(
        pageColor: theme.colorScheme.primary,
        bubble: Icon(Icons.language),
        body: Text(lang.welcomeLang),
        mainImage: LanguageSelection(),
        title: Text(
          lang.selectLanguage,
          style: TextStyle(fontFamily: 'Georgia', color: Colors.white),
        ),
        titleTextStyle: TextStyle(fontSize: 30),
        bodyTextStyle: TextStyle(fontFamily: 'Georgia', color: Colors.white),
      ),
      PageViewModel(
        pageColor: theme.colorScheme.primary,
        body: Text(lang.welcomeTheme),
        mainImage: themeSelection(theme, preferences, lang),
        title: Text(
          lang.selectLanguage,
        ),
        titleTextStyle: TextStyle(fontSize: 30),
        bubble: Icon(Icons.dark_mode),
        bodyTextStyle: TextStyle(fontFamily: 'Georgia', color: Colors.white),
      ),
      PageViewModel(
        pageColor: theme.colorScheme.primary,
        bubble: Icon(Icons.done),
        body: Text(lang.welcomeDone),
        mainImage: CircleAvatar(
          backgroundColor: theme.primaryColor,
          child: Icon(
            Icons.done,
            color: theme.colorScheme.primary,
          ),
        ),
        titleTextStyle: TextStyle(fontSize: 30),
        title: Text('${lang.everythingDone}!'),
        bodyTextStyle: TextStyle(fontFamily: 'Georgia', color: Colors.white),
      ),
    ];
    return IntroViewsFlutter(
      pages,
      onTapDoneButton: () {
        auth.setLoggedIn();
      },
      showBackButton: true,
      showNextButton: true,
      backText: Text(
        lang.back,
        style: theme.textTheme.bodyText1,
      ),
      nextText: Text(
        lang.next,
        style: theme.textTheme.bodyText1,
      ),
      doneText: Text(
        lang.done,
        style: theme.textTheme.bodyText1,
      ),
      skipText: Text(
        lang.skip,
        style: theme.textTheme.bodyText1,
      ),
    );
  }

  Widget themeSelection(
      ThemeData theme, PreferencesProvider preferences, S lang) {
    return Center(
      child: Card(
        color: theme.primaryColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          leading: Icon(Icons.dark_mode, color: theme.colorScheme.primary),
          trailing: CupertinoSwitch(
            trackColor: theme.colorScheme.primary,
            value: preferences.getIsDarkTheme(),
            onChanged: (value) {
              preferences.changeTheme(value: value);
            },
          ),
          title: Text(
            lang.theme,
            style: TextStyle(color: theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PreferencesProvider>(context).getTheme();
    final preferences = Provider.of<PreferencesProvider>(context);
    final List<LanguageModel> languageConstant = [
      LanguageConstant.tr,
      LanguageConstant.en,
      LanguageConstant.fr
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      child: ListView.builder(
          itemCount: languageConstant.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: theme.primaryColor,
                child: ListTile(
                  onTap: () async {
                    await preferences
                        .changeLocale(languageConstant[index].shortName);
                    print(preferences.currentLocale);
                  },
                  title: Text(
                    languageConstant[index].name,
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      languageConstant[index].shortName,
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
