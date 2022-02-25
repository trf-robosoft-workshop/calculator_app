import 'package:calculator_app/my_button.dart';
import 'package:calculator_app/user_input.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userInput = "";
  String answer = "0";

  final List<String> buttons = [
    'AC',
    '√',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '=',
  ];

  calculateResult() {
    String finaluserinput = userInput;
    // most math parsers use '*' instead of 'x' for multiplication
    finaluserinput = userInput.replaceAll('x', '*');

    // Parser use to solve maths expressions by implicitly converting them to int/double
    Parser p = Parser();

    // maths expression
    Expression exp = p.parse(finaluserinput);

    // keeps track of variables during calculation
    ContextModel cm = ContextModel();

    // final result
    num eval = exp.evaluate(EvaluationType.REAL, cm);

    // converting 100.0 to 100
    eval = (eval == eval.truncate()) ? eval.toInt() : eval;

    answer = eval.toString();
  }

  bool isOperator(String str) =>
      (str == "+" || str == "-" || str == "x" || str == "/" || str == "%");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            UserInput(
              myText: userInput,
              myFontSize: 32,
              myColor: Colors.grey.shade700,
            ),
            UserInput(
              myText: answer,
              myFontSize: 60,
              myColor: Colors.black,
            ),
            const Divider(
              thickness: 1.5,
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttons.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  // AC button
                  if (index == 0) {
                    return MyButton(
                      myText: buttons[index],
                      myColor: Colors.orange,
                      myFontSize: 28,
                      onButtonPressed: () {
                        setState(() {
                          userInput = "";
                          answer = "0";
                          print(userInput);
                        });
                      },
                    );
                  }
                  // sqrt
                  else if (index == 1) {
                    return MyButton(
                      myText: buttons[index],
                      myColor: Colors.orange,
                      myFontSize: 28,
                      onButtonPressed: () {
                        setState(() {
                          userInput += "sqrt";
                          // userInput += buttons[index];
                          print(userInput);
                        });
                      },
                    );
                  }
                  // = button
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      myText: buttons[index],
                      myColor: Colors.orange,
                      myFontSize: 36,
                      onButtonPressed: () {
                        setState(() {
                          calculateResult();
                          print("Equal to pressed");
                          print(answer);
                        });
                      },
                    );
                  } else {
                    return MyButton(
                      myText: buttons[index],
                      myColor: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.black,
                      myFontSize: 28,
                      onButtonPressed: () {
                        setState(() {
                          userInput += buttons[index];
                          print(userInput);
                        });
                      },
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
