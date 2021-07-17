import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:password_saver/src/widget/logo.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff07489c), Color(0xff1F66DE)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Logo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.orbit,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
