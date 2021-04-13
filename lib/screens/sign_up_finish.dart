import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/components.dart';

class SignUpFinish extends StatefulWidget {
  final id = 'signupfinish';
  //numbersList.add(obj1);
  @override
  _SignUpFinishState createState() => _SignUpFinishState();
}

class _SignUpFinishState extends State<SignUpFinish> {
  List<Numbers> numberList = <Numbers>[
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homeBG.png"),
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldTitle('COUNTRY', kSingupLabel),
                        SizedBox(height: 5),
                        countriesLine(countryList),
                        SizedBox(height: 20),
                        TextFieldTitle('VIRTUAL NUMBERS', kSingupLabel),
                        SizedBox(height: 5),
                        numbersLine(numberList),
                        CheckboxListTile(
                          title: Text(
                              'By joining Dialer you agree to our Terms & Conditions and Privacy Policy.'),
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
                        RaisedGradientButton(
                            child: Text(
                              'FINISH',
                              style: TextStyle(color: Colors.white),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFFD67B0),
                                Color(0xFF5F25DD)
                              ],
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ), /* add child content here */
        ),
      ),
    );
  }
}

class numbersLine extends StatefulWidget {
  List<Numbers> numbersList;
  numbersLine(this.numbersList);

  @override
  _numbersLineState createState() => _numbersLineState();
}

class _numbersLineState extends State<numbersLine> {
  bool check = false;
  bool line = false;
  Numbers currentLine = Numbers(
      number: '',
      price: '',
      goldOrSilver: '',
      imageSource: '',
      showIcon: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        check
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    line = !line;
                  });
                },
                child: currentLine.getNumberLine(true))
            : InkWell(
                onTap: () {
                  setState(() {
                    line = !line;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('None', style: kSingupPlaceHolder),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
        line
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(children: [
                  for (var i in widget.numbersList)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentLine.setGoldOrSilver(i.goldOrSilver);
                          currentLine.setImageSource(i.imageSource);
                          currentLine.setPrice(i.price);
                          currentLine.setNumber(i.number);
                          currentLine.setShowIcon(true);
                          check = true;
                          line = !line;
                        });
                      },
                      child: Numbers(
                        number: i.number,
                        price: i.price,
                        goldOrSilver: i.goldOrSilver,
                        imageSource: i.imageSource,
                        showIcon: i.showIcon,
                      ).getNumberLine(false),
                    ),
                ]),
              )
            : Container(),
      ],
    );
  }
}

class Numbers {
  String number;
  String price;
  String goldOrSilver;
  String imageSource;
  bool showIcon;

  Numbers({
    @required this.number,
    this.price,
    this.goldOrSilver,
    this.imageSource,
    this.showIcon = false,
  });

  void setNumber(String x) {
    number = x;
  }

  void setPrice(String x) {
    price = x;
  }

  void setGoldOrSilver(String x) {
    goldOrSilver = x;
  }

  void setImageSource(String x) {
    imageSource = x;
  }

  void setShowIcon(bool x) {
    showIcon = x;
  }

  @override
  Widget getNumberLine(bool check) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Text(
                  number,
                  style: kNumberText,
                ),
              ),
              Expanded(
                flex: 20,
                child: Text(
                  price,
                  style: kNumberPriceText,
                ),
              ),
              Expanded(
                flex: 10,
                child: Text(
                  goldOrSilver,
                  style: goldOrSilver == 'Gold' ? kGold : kSilver,
                ),
              ),
              Expanded(
                flex: 10,
                child: Image(
                  image: AssetImage(imageSource),
                ),
              ),
              showIcon ? Icon(Icons.keyboard_arrow_down_rounded) : Container(),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFE9E9E9),
          height: 0,
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
        check
            ? SizedBox(
                height: 10,
              )
            : Container(),
      ],
    );
  }
}

class countriesLine extends StatefulWidget {
  List<Countries> countriesList;
  countriesLine(this.countriesList);

  @override
  _countriesLineState createState() => _countriesLineState();
}

class _countriesLineState extends State<countriesLine> {
  bool check = false;
  bool line = false;
  Countries currentLine =
      Countries(country: '', imageSource: '', showIcon: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        check
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    line = !line;
                  });
                },
                child: currentLine.getCountryLine(true))
            : InkWell(
                onTap: () {
                  setState(() {
                    line = !line;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search...',
                            style: kSingupPlaceHolder,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
        Divider(
          color: Color(0xFFE9E9E9),
          height: 0,
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
        line
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(children: [
                  for (var i in widget.countriesList)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentLine.setCountry(i.country);
                          currentLine.setImageSource(i.imageSource);
                          currentLine.setShowIcon(true);
                          check = true;
                          line = !line;
                        });
                      },
                      child: Countries(
                        country: i.country,
                        imageSource: i.imageSource,
                        showIcon: i.showIcon,
                      ).getCountryLine(false),
                    ),
                ]),
              )
            : Container(),
      ],
    );
  }
}

class Countries {
  String country;
  String imageSource;
  bool showIcon;

  Countries({
    @required this.country,
    @required this.imageSource,
    this.showIcon = false,
  });

  void setCountry(String x) {
    country = x;
  }

  void setImageSource(String x) {
    imageSource = x;
  }

  void setShowIcon(bool x) {
    showIcon = x;
  }

  @override
  Widget getCountryLine(bool check) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(imageSource),
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  country,
                  style: kCountryText,
                ),
              ),
              showIcon ? Icon(Icons.keyboard_arrow_down_rounded) : Container(),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFE9E9E9),
          height: 0,
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
        check
            ? SizedBox(
                height: 10,
              )
            : Container(),
      ],
    );
  }
}
