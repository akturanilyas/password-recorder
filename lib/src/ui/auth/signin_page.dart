import 'package:flutter/material.dart';
import 'package:password_saver/src/provider/auth_provider.dart';
import 'package:password_saver/src/provider/validation_provider.dart';
import 'package:password_saver/src/ui/auth/signup_page.dart';
import 'package:password_saver/src/widget/bezier_container.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'pass',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'word',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'recor',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'der',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _emailField(String title, ValidationProvider validationProvider) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (value) => {validationProvider.setEmail(value)},
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _passwordField(String title, ValidationProvider validationProvider) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (value) => {validationProvider.setPassword(value)},
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account ?",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff07489c),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    final validationProvider =
        Provider.of<ValidationProvider>(context, listen: true);
    return Column(
      children: <Widget>[
        _emailField('Email id', validationProvider),
        _passwordField('Password', validationProvider),
      ],
    );
  }

  Widget _submitButton() {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final validationProvider =
        Provider.of<ValidationProvider>(context, listen: true);
    return InkWell(
      onTap: () async {
        if (validationProvider.email.value == null ||
            validationProvider.password.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Email or password can not be blank')));
        } else {
          String result = await authProvider.signIn(
              validationProvider.email.value!,
              validationProvider.password.value!);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result),
            duration: Duration(seconds: 5),
          ));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient:
                LinearGradient(colors: [Color(0xff07489c), Color(0xff1F66DE)])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  // TODO: Add forget password button
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   alignment: Alignment.centerRight,
                  //   child: Text('Forgot Password ?',
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.w500)),
                  // ),
                  // _divider(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
