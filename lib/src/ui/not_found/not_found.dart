import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);
  static const String path = '/notfound';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('NotFoundPage'),
    );
  }
}
