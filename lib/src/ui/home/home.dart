import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/password_provider.dart';
import 'package:password_saver/src/widget/create_password.dart';
import 'package:password_saver/src/widget/password_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<PasswordProvider>(context, listen: false).getMyPasswords();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Passwords'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/settings')},
              icon: Icon(Icons.settings, color: Colors.white))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myPasswords(),
          InkWell(
              onTap: () => {addPassword(context)},
              child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .1,
                  child: Icon(Icons.add)))
        ],
      ),
    );
  }

  Widget myPasswords() {
    final myPasswords =
        Provider.of<PasswordProvider>(context, listen: false).myPasswords;
    return Expanded(
      child: ListView.builder(
        itemCount: myPasswords.length,
        itemBuilder: (BuildContext context, int index) {
          return passwordTile(myPasswords[index]);
        },
      ),
    );
  }
}
