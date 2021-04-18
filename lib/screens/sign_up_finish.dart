import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/flutter_layouts.dart';
import 'package:shlomi_project/components/RestComponents.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/Buttons.dart';
import 'package:shlomi_project/components/Numbers.dart';
import 'package:shlomi_project/components/Countries.dart';

class SignUpFinish extends StatefulWidget {
  final id = 'signupfinish';
  //numbersList.add(obj1);
  @override
  _SignUpFinishState createState() => _SignUpFinishState();
}

class _SignUpFinishState extends State<SignUpFinish> {
  List<Numbers> numberList = <Numbers>[
    Numbers(
        number: '123 456789',
        price: '',
        goldOrSilver: '',
        imageSource: '',
        showIcon: false),
    Numbers(
        number: '212 1211212',
        price: '',
        goldOrSilver: '',
        imageSource: '',
        showIcon: false),
    Numbers(
        number: '+972 50 1020333',
        price: '5\$/month',
        goldOrSilver: 'Silver',
        imageSource: 'assets/first-silver.png',
        showIcon: false),
    Numbers(
        number: '+972 54 1213144',
        price: '5\$/month',
        goldOrSilver: 'Silver',
        imageSource: 'assets/first-silver.png',
        showIcon: false),
    Numbers(
        number: '+972 50 000000',
        price: '100\$/month',
        goldOrSilver: 'Gold',
        imageSource: 'assets/first-gold.png',
        showIcon: false)
  ];
  List<Countries> countryList = <Countries>[
    Countries(
        country: 'Israel', imageSource: 'assets/israel.png', showIcon: false),
    Countries(
        country: 'France', imageSource: 'assets/israel.png', showIcon: false),
    Countries(
        country: 'Spain', imageSource: 'assets/israel.png', showIcon: false),
  ];
  Numbers selectedUser;
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Footer(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/homeBG.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    NewBackButton(),
                    SizedBox(height: 100),
                    Text(
                      'Almost done!',
                      style: kMainText,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextFieldTitle('COUNTRY', kSingupLabel),
                          SizedBox(height: 5),
                          countriesLine(countryList),
                          SizedBox(height: 20),
                          TextFieldTitle('VIRTUAL NUMBERS', kSingupLabel),
                          SizedBox(height: 5),
                          numbersLine(numberList),
                          CheckboxListTile(
                            activeColor: Color(0xFF5F25DD),
                            title: RichText(
                              text: TextSpan(
                                style: kTermsStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'By joining Dialer you agree to our '),
                                  TextSpan(
                                      text:
                                          'Terms & Conditions and Privacy Policy.',
                                      style: kLinkStyle,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service"');
                                        }),
                                ],
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: checkBoxValue,
                            contentPadding: EdgeInsets.all(0),
                            onChanged: (newVal) {
                              setState(() {
                                checkBoxValue = newVal;
                              });
                            },
                          ),
                          SizedBox(height: 170),
                          // CountriesList('Israel', 'assets/israel.png'),
                          //SelectItem(numberList),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ), /* add child content here */
          ),
        ),
      ),
      footer: Container(
        color: Color(0xFFC4C4C4),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: RaisedGradientButton(
            child: Text(
              'FINISH',
              style: TextStyle(color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFFD67B0), Color(0xFF5F25DD)],
            ),
            onPressed: () {}),
      ),
    );
  }
}
