import 'package:flutter/material.dart';
import 'package:password_saver/src/widget/my_password.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          MyPasswords(),
          InkWell(
              onTap: null,
              child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .1,
                  child: Icon(Icons.add)))
        ],
      ),
    );
  }
}
