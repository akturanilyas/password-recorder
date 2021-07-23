import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:password_saver/src/widget/logo.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PreferencesProvider>(context).getTheme();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(color: theme.canvasColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Logo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
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
