import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/flutter_layouts.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/Buttons.dart';
import 'package:shlomi_project/components/RestComponents.dart';
import 'package:shlomi_project/screens/sign_up_finish.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpBusiness extends StatefulWidget {
  final String id = 'singupbusiness';
  @override
  _SignUpBusinessState createState() => _SignUpBusinessState();
}

class _SignUpBusinessState extends State<SignUpBusiness> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  File _image;
  final picker = ImagePicker();
  List<String> startHours = ['8:00', '9:00', '10:00', '11:00', '12:00'];
  List<String> endingHours = ['14:00', '15:00', '16:00', '17:00', '18:00'];

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          NewBackButton(),
                          Text(
                            'Create your business',
                            style: kMainText,
                          ),
                          Text(
                            'account',
                            style: kMainText,
                          ),
                          SizedBox(height: 10),

                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            padding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            child: _image == null
                                ? IconButton(
                                    icon: Icon(
                                      Icons.photo_camera_rounded,
                                      size: 20.0,
                                      color: Color(0xFFB0B0B0),
                                    ),
                                    onPressed: getImage)
                                : IconButton(
                                    iconSize: 50,
                                    onPressed: getImage,
                                    icon: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ).image,
                                    ),
                                  ),
                            shape: CircleBorder(),
                          ),
                          TextFieldTitle('BUSINESS NAME', kSingupLabel),
                          SizedBox(height: 10),
                          GetTextField('Decon'),
                          SizedBox(height: 10),
                          TextFieldTitle('BUSINESS NUMBER', kSingupLabel),
                          SizedBox(height: 10),
                          GetTextField('+972------'),
                          SizedBox(height: 10),
                          TextFieldTitle('ADRESS', kSingupLabel),
                          SizedBox(height: 10),
                          GetTextField('E.g. Berlin, Berlinka st'),
                          SizedBox(height: 10),
                          TextFieldTitle('WORKING HOURS', kSingupLabel),
                          //TextFieldTitle('24/7', kSecondaryText),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          tileColor: Colors.white,
                          title: Text('24/7'),
                          trailing: CupertinoSwitch(
                            value: check1,
                            activeColor: Color(0xFF5F25DD),
                            onChanged: (bool value) {
                              setState(() {
                                check1 = value;
                                if (check2) {
                                  check2 = !check2;
                                }
                                if (check3) {
                                  check3 = !check3;
                                }
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              check1 = !check1;
                              if (check2) {
                                check2 = !check2;
                              }
                              if (check3) {
                                check3 = !check3;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      height: 0.0,
                      thickness: 1,
                      color: Color(0xFFE1E1E1),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      title: Text('Every day from:'),
                      trailing: CupertinoSwitch(
                        activeColor: Color(0xFF5F25DD),
                        value: check2,
                        onChanged: (bool value) {
                          setState(() {
                            check2 = value;
                            if (check1) {
                              check1 = !check1;
                            }
                            if (check3) {
                              check3 = !check3;
                            }
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          check2 = !check2;
                          if (check1) {
                            check1 = !check1;
                          }
                          if (check3) {
                            check3 = !check3;
                          }
                        });
                      },
                    ),
                    check2
                        ? GetHours(
                            startHours: startHours, endHours: endingHours)
                        : Container(),
                    Divider(
                      height: 0.0,
                      thickness: 1,
                      color: Color(0xFFE1E1E1),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      title: Text('Customized'),
                      trailing: CupertinoSwitch(
                        activeColor: Color(0xFF5F25DD),
                        value: check3,
                        onChanged: (bool value) {
                          setState(() {
                            check3 = value;
                            if (check2) {
                              check2 = !check2;
                            }
                            if (check1) {
                              check1 = !check1;
                            }
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          check3 = !check3;
                          if (check2) {
                            check2 = !check2;
                          }
                          if (check1) {
                            check1 = !check1;
                          }
                        });
                      },
                    ),
                    check3
                        ? GetSwitch('Monday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Thursday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Wednesday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Tuesday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Friday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Saturday', startHours, endingHours)
                        : Container(),
                    check3
                        ? GetSwitch('Sunday', startHours, endingHours)
                        : Container(),
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
        child: BorderGradientButton(
            child: Text(
              'NEXT',
              style: kPurpleButtonText,
            ),
            backround: Color(0xFFC4C4C4),
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFFD67B0), Color(0xFF5F25DD)],
            ),
            onPressed: () {
              //Navigator.pushNamed(context, SignUpFinish().id);
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SignUpFinish()));
            }),
      ),
    );
  }
}
