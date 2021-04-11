import 'package:flutter/material.dart';
import 'screens/sign_up_checkboxes.dart';
import 'screens/sign_up_business.dart';
import 'screens/sign_up_finish.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shlomi_project',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        SignUpBusiness().id: (context) => SignUpBusiness(),
        SignUpFinish().id: (context) => SignUpFinish(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFC4C4C4),
      ),
    );
  }
}
