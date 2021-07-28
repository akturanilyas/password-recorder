import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:password_saver/src/widget/password_tile.dart';
import 'package:provider/provider.dart';
import 'package:password_saver/generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  @override
  void initState() {
    Provider.of<PasswordProvider>(context, listen: false).getMyPasswords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));

    List<Widget> pages = [
      MyPassword(),
      AddPassword(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.linear,
        backgroundColor: theme.scaffoldBackgroundColor,
        color: theme.colorScheme.primary,
        items: <Widget>[
          Icon(Icons.list, size: 30, color: theme.primaryColor),
          Icon(Icons.add, size: 30, color: theme.primaryColor),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text(
          S.of(context).myPassword,
          style: theme.textTheme.bodyText1,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/settings')},
            icon: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: pages[page],
      //  _myPasswords(passwordProvider, context)
    );
  }
}

class MyPassword extends StatefulWidget {
  @override
  _MyPasswordState createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: true);
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    return passwordProvider.isLoading
        ? Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: _passwordList(),
          );
  }

  Widget _passwordList() {
    final myPasswords =
        Provider.of<PasswordProvider>(context, listen: true).myPasswords;
    return ListView.builder(
      itemCount: myPasswords.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: passwordTile(myPasswords[index], context),
          ),
        );
      },
    );
  }
}

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: true);
    var lang = S.of(context);
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _form(lang, theme),
          _createButton(context, theme, lang, passwordProvider)
        ],
      ),
    );
  }

  TextButton _createButton(BuildContext context, ThemeData theme, S lang,
      PasswordProvider passwordProvider) {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .1),
          minimumSize: Size(30, 30),
          backgroundColor: theme.canvasColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)))),
      onPressed: () {
        passwordProvider.createPassword(
            nameController.value.text,
            passwordController.value.text,
            descriptionController.value.text,
            lang);
      },
      child: Text(
        lang.create,
        style: theme.textTheme.bodyText1,
      ),
    );
  }

  Column _form(S lang, ThemeData theme) {
    return Column(
      children: <Widget>[
        TextFormField(
          style: theme.textTheme.headline1,
          cursorColor: theme.canvasColor,
          controller: nameController,
          decoration: InputDecoration(
              icon: Icon(
                Icons.text_format,
                color: theme.canvasColor,
              ),
              labelText: lang.passwordName,
              labelStyle: theme.textTheme.headline1),
        ),
        TextFormField(
          cursorColor: theme.canvasColor,
          style: theme.textTheme.headline1,
          controller: passwordController,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: theme.canvasColor,
              ),
              labelText: lang.password,
              labelStyle: theme.textTheme.headline1),
        ),
        TextFormField(
          style: theme.textTheme.headline1,
          cursorColor: theme.textTheme.headline1!.color,
          controller: descriptionController,
          decoration: InputDecoration(
            icon: Icon(
              Icons.description,
              color: theme.canvasColor,
            ),
            labelText: lang.description,
            labelStyle: theme.textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
