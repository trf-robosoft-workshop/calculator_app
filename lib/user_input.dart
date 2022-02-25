import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  UserInput(
      {Key? key,
      required this.myText,
      required this.myFontSize,
      required this.myColor})
      : super(key: key);

  String myText;
  double myFontSize;
  Color myColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            myText,
            style: TextStyle(fontSize: myFontSize, color: myColor),
          )),
    );
  }
}
