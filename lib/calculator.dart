import 'package:flutter/material.dart';
import 'calculatorWidgets/keyboard.dart';
import "package:eval_ex/expression.dart";

MaterialColor primaryColor = Colors.blue;
Color statusColor = primaryColor;
MaterialAccentColor accentColor = Colors.blueAccent;
double small = 8;
double medium = 16;
Color white = Colors.white;

// Widget class
class CalculatorWidget extends StatefulWidget {
  CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorState();
}

// State
class _CalculatorState extends State<CalculatorWidget> {
  String expression = "0";
  bool singleClear = false;

  void clearFormatting() {
    setState(() {
      statusColor = primaryColor;
      singleClear = false;
    });
  }

  //Adding characters to the screen
  void updateEquation(String val) {
    setState(() {
      if (expression == "0") {
        expression = "";
      }
      expression += val;
      clearFormatting();
    });
  }

  // Deleting characters
  void deleteLast() {
    setState(() {
      statusColor = primaryColor;
      if (singleClear) {
        expression = "0";
      } else if (!(expression == "0")) {
        expression = expression.substring(0, (expression.length - 1));
      } else if (expression == "" || expression == "0") {
        expression = "0";
      }
      singleClear = false;
    });
  }

  void clearAll() {
    setState(() {
      statusColor = primaryColor;
      if (!(expression == "0")) {
        expression = "0";
      }
    });
  }

  void evaluateExpression() {
    try {
      expression = expression.replaceAll("÷", "/");
      expression = expression.replaceAll("x", "*");
      expression = expression.replaceAllMapped(RegExp(r"\d+%\d+"), (Match m) {
        List<String> match = m[0]!.split("%");
        return "(${match[0]}*${match[1]}/100)";
      });
      Expression exp;
      exp = Expression(expression);
      setState(() {
        expression = exp.eval()!.toString();
        statusColor = primaryColor;
        singleClear = true;
      });
    } catch (e) {
      setState(() {
        print(e);
        statusColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]!),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.only(top: 80, bottom: 20, right: 20),
                child: SelectableText(
                  // EXPRESSION DISPLAY
                  expression,
                  style: TextStyle(fontSize: 24, color: statusColor),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: KeyBoard(
            updater: updateEquation,
            delete: deleteLast,
            clear: clearAll,
            equality: evaluateExpression,
          ),
        ),
      ],
    );
  }
}
