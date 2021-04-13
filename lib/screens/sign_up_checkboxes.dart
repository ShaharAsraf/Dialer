import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/flutter_layouts.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/Buttons.dart';
import 'package:shlomi_project/screens/sign_up_business.dart';

class MyHomePage extends StatefulWidget {
  final id = 'homepage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Footer(
      body: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homeBG.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100),
                    Text(
                      'Welcome!',
                      style: kMainText,
                    ),
                    Text(
                      'Tell us who you are...',
                      style: kSecondaryText,
                    ),
                    SizedBox(height: 20),
                    HomePageButton(
                        bgColor: Colors.white,
                        title: 'Business',
                        imageSource: 'assets/homePageButton1.png',
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignUpBusiness()));
                        }).getButton(),
                    HomePageButton(
                        bgColor: Color(0xFFE7E1F3),
                        title: 'Ordinary',
                        imageSource: 'assets/homePageButton2.png',
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignUpBusiness()));
                        }).getButton(),
                    SizedBox(height: 190),
                    Text(
                      'Already have an account?',
                      style: kSecondaryText,
                    ),
                  ],
                ),
              ],
            ),
          ), /* add child content here */
        ),
      ),
      footer: Container(
        color: Color(0xFFC4C4C4),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: BorderGradientButton(
            child: Text(
              'LOG IN',
              style: kPurpleButtonText,
            ),
            backround: Color(0xFFC4C4C4),
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFFD67B0), Color(0xFF5F25DD)],
            ),
            onPressed: () {}),
      ),
    );
  }
}
