import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';

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
