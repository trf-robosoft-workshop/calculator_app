import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.myColor,
      required this.myFontSize,
      required this.myText,
      this.onButtonPressed})
      : super(key: key);

  String myText;
  Color myColor;
  double myFontSize;
  final onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onButtonPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: myText == "=" ? myColor : Colors.transparent,
              child: Center(
                child: Text(
                  myText,
                  style: TextStyle(
                      color: myText == "=" ? Colors.white : myColor,
                      fontSize: myFontSize),
                ),
              ),
            ),
          ),
        ));
  }
}
