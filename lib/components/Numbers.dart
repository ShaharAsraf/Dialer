import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';

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
