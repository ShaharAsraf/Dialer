import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';
import 'package:shlomi_project/components/components.dart';
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
  List<String> hours = ['8:00', '9:00', '10:00', '11:00', '12:00'];

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homeBG.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Row(
                            children: [
                              IconButton(
                                icon:
                                    Icon(Icons.arrow_back_ios, color: mainGrey),
                              ),
                              Text(
                                'Back',
                                style: kSecondaryText,
                              ), // You can
                            ],
                          ),
                        ),
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
                          fillColor: Colors.white,
                          child: _image == null
                              ? IconButton(
                                  icon: Icon(
                                    Icons.photo_camera_rounded,
                                    size: 20.0,
                                    color: Color(0xFFB0B0B0),
                                  ),
                                  onPressed: getImage)
                              : Image.file(_image),
                          padding: EdgeInsets.all(22.0),
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
                  check2 ? GetHours(hours: hours) : Container(),
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
                  check3 ? GetSwitch('Monday', hours) : Container(),
                  check3 ? GetSwitch('Thursday', hours) : Container(),
                  check3 ? GetSwitch('Wednesday', hours) : Container(),
                  check3 ? GetSwitch('Tuesday', hours) : Container(),
                  check3 ? GetSwitch('Friday', hours) : Container(),
                  check3 ? GetSwitch('Saturday', hours) : Container(),
                  check3 ? GetSwitch('Sunday', hours) : Container(),
                  SizedBox(height: 10),
                  UnicornOutlineButton(
                    strokeWidth: 2,
                    radius: 6,
                    gradient: LinearGradient(
                        colors: [Color(0xFF5F25DD), Color(0xFFFD67B0)]),
                    child: Text('NEXT', style: kPurpleButtonText),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpFinish().id);
                    },
                  ),
                ],
              ),
            ),
          ), /* add child content here */
        ),
      ),
    );
  }
}

class GetSwitch extends StatefulWidget {
  String title;
  List<String> hours;
  bool check = false;
  GetSwitch(this.title, this.hours);
  @override
  _GetSwitchState createState() => _GetSwitchState();
}

class _GetSwitchState extends State<GetSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            tileColor: Color(0xFFFAFAFA),
            title: Text(widget.title),
            trailing: CupertinoSwitch(
              activeColor: Color(0xFF5F25DD),
              value: widget.check,
              onChanged: (bool value) {
                setState(() {
                  widget.check = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                widget.check = !widget.check;
              });
            },
          ),
          widget.check ? GetHours(hours: widget.hours) : Container(),
        ],
      ),
    );
  }
}

class GetHours extends StatelessWidget {
  GetHours({this.hours});
  final List<String> hours;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetList(hours[0], hours),
          )),
          Expanded(child: GetList(hours[0], hours)),
        ],
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

class GetTextField extends StatelessWidget {
  GetTextField(this.placeholder);
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: kSingupPlaceHolder,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE9E9E9), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE9E9E9), width: 1.0),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
