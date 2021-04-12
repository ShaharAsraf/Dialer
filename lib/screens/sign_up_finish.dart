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
  List<String> Countries = ['Israel', 'US', 'Eng', 'France'];
  List<String> numbers = ['054311313', '054334313', '0541212312', '052872313'];
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
              fit: BoxFit.cover,
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
                        GetList('Search', Countries),
                        SizedBox(height: 20),
                        TextFieldTitle('VIRTUAL NUMBERS', kSingupLabel),
                        GetList('None', numbers),
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
                        SelectItem(numberList),

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

class SelectItem extends StatefulWidget {
  List<Numbers> numbersList;
  SelectItem(this.numbersList);
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  bool check = false;
  bool line = false;
  Numbers obj;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          line = !line;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        child: Column(
          children: [
            check
                ? Column(children: [])
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('None'),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
            line
                ? Column(children: [
                    for (var i in widget.numbersList)
                      Numbers(
                        number: i.number,
                        price: i.price,
                        goldOrSilver: i.goldOrSilver,
                        imageSource: i.imageSource,
                        showIcon: i.showIcon,
                      ),
                  ])
                : Container(),
          ],
        ),
      ),
    );
  }
}

class Numbers extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return Numbers(
          number: number,
          showIcon: showIcon,
          goldOrSilver: goldOrSilver,
          price: price,
          imageSource: imageSource,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        color: Colors.white,
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
    );
  }
}

class CountriesList extends StatelessWidget {
  final String imageSource;
  final String country;
  CountriesList(this.country, this.imageSource);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.white,
      child: Row(
        children: [
          Image(
            image: AssetImage(imageSource),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            country,
            style: kCountryText,
          ),
        ],
      ),
    );
  }
}

//
// DropdownButton<Numbers>(
// hint: Text("Select item"),
// value: selectedUser,
// onChanged: (Numbers Value) {
// setState(() {
// selectedUser = Value;
// });
// },
// items: numberList.map((Numbers user) {
// return DropdownMenuItem<Numbers>(
// value: user,
// child: Row(
// children: [
// Expanded(
// flex: 50,
// child: Text(
// user.number,
// style: kNumberText,
// ),
// ),
// Expanded(
// flex: 20,
// child: Text(
// user.price,
// style: kNumberPriceText,
// ),
// ),
// Expanded(
// flex: 10,
// child: Text(
// user.goldOrSilver,
// style: user.goldOrSilver == 'Gold'
// ? kGold
//     : kSilver,
// ),
// ),
// Expanded(
// flex: 10,
// child: Image(
// image: AssetImage(user.imageSource),
// ),
// ),
// user.showIcon
// ? Icon(Icons.keyboard_arrow_down_rounded)
//     : Container(),
// ],
// ),
// );
// }).toList(),
// ),
