import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';
import 'package:flutter/cupertino.dart';

class GetList extends StatefulWidget {
  String dropdownPlaceholder;
  String dropdownValue;
  List<String> list;
  GetList(this.dropdownPlaceholder, this.list);

  @override
  _GetListState createState() => _GetListState();
}

class _GetListState extends State<GetList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE9E9E9)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(widget.dropdownPlaceholder),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          elevation: 16,
          style: kSingupPlaceHolder,
          onChanged: (String newValue) {
            setState(() {
              widget.dropdownValue = newValue;
              widget.dropdownPlaceholder = widget.dropdownValue;
            });
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
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
      textInputAction: TextInputAction.next,
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
