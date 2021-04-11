import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/components.dart';

class SignUpFinish extends StatefulWidget {
  final id = 'signupfinish';
  @override
  _SignUpFinishState createState() => _SignUpFinishState();
}

class _SignUpFinishState extends State<SignUpFinish> {
  List<String> Countries = ['Israel', 'US', 'Eng', 'France'];
  List<String> Numbers = ['054311313', '054334313', '0541212312', '052872313'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: kSecondaryText,
        ), // You can add title here
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mainGrey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFFC4C4C4), //You can make this transparent
        elevation: 0.0, //No shadow
      ),
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
                'Almost done!',
                style: kMainText,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFieldTitle('COUNTRY', kSingupLabel),
                    GetList('Search', Countries),
                    SizedBox(height: 20),
                    TextFieldTitle('VIRTUAL NUMBERS', kSingupLabel),
                    GetList('None', Numbers),
                    SizedBox(height: 170),
                    RaisedGradientButton(
                        child: Text(
                          'FINISH',
                          style: TextStyle(color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xFFFD67B0), Color(0xFF5F25DD)],
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ), /* add child content here */
      ),
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  TextFieldTitle(this.title, this.style);
  final String title;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: style,
        ),
      ],
    );
  }
}
