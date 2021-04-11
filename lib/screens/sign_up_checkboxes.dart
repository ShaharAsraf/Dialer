import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/components.dart';
import 'package:shlomi_project/screens/sign_up_business.dart';

class MyHomePage extends StatefulWidget {
  final id = 'homepage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homeBG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    Navigator.pushNamed(context, SignUpBusiness().id);
                  }).getButton(),
              HomePageButton(
                  bgColor: Color(0xFFE7E1F3),
                  title: 'Ordinary',
                  imageSource: 'assets/homePageButton2.png',
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpBusiness().id);
                  }).getButton(),
              SizedBox(height: 170),
              Text(
                'Already have an account?',
                style: kSecondaryText,
              ),
              SizedBox(height: 10),
              UnicornOutlineButton(
                strokeWidth: 2,
                radius: 6,
                gradient: LinearGradient(
                    colors: [Color(0xFF5F25DD), Color(0xFFFD67B0)]),
                child: Text('LOG IN', style: kPurpleButtonText),
                onPressed: () {},
              ),
            ],
          ),
        ), /* add child content here */
      ),
    );
  }
}
