import 'package:flutter/material.dart';
import "package:eval_ex/expression.dart";

import 'calculatorWidgets/keyboard.dart';
import 'calculatorWidgets/functions.dart';
import 'calculatorWidgets/constants.dart';

MaterialColor primaryColor = Colors.blue;
Color statusColor = primaryColor;
MaterialAccentColor accentColor = Colors.blueAccent;
double small = 8;
double medium = 16;
Color white = Colors.white;
int defaultTabIndex = 1;

// Widget class
class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorState();
}

// State
class _CalculatorState extends State<CalculatorWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: defaultTabIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
    List<String> operators = ["+", "-", "x", "÷", "%", "."];
    setState(() {
      if (expression == "0" && !operators.contains(val)) {
        expression = val;
      } else if (expression.isNotEmpty &&
          !(operators.contains(expression[expression.length - 1]) &&
              operators.contains(val))) {
        expression += val;
        clearFormatting();
      }
    });
  }

  //Adding characters then closing the functions tab
  void updateExpressionAndClose(String val) {
    updateEquation(val);
    _tabController.animateTo(defaultTabIndex);
  }

  // Deleting characters
  void deleteLast() {
    setState(() {
      statusColor = primaryColor;
      if (singleClear || expression.length == 1) {
        expression = "0";
      } else if (!(expression == "0")) {
        expression = expression.substring(0, (expression.length - 1));
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
      //Turning symbols to expressions that match.
      // missing closing bracket
      expression = expression.replaceAllMapped(
        RegExp(r"\((?!.*\))"),
        (Match m) => "${m[0]})",
      );
      // division
      expression = expression.replaceAll("÷", "/");
      // multiplication
      expression = expression.replaceAll("x", "*");
      // percentage
      expression = expression.replaceAllMapped(RegExp(r"\d+%\d+"), (Match m) {
        List<String> match = m[0]!.split("%");
        return "(${match[0]}*${match[1]}/100)";
      });
      //square root
      expression = expression.replaceAllMapped(RegExp(r"√\d+(\.\d+)?"), (
        Match m,
      ) {
        String match = m[0]!.substring(1);
        return "sqrt($match)";
      });
      // inverse trigonometric functions
      expression = expression.replaceAll("sin-1(", "arcsin(");
      expression = expression.replaceAll("cos-1(", "arccos(");
      expression = expression.replaceAll("tan-1(", "arctan(");
      expression = expression.replaceAll("sinh-1(", "arcsinh(");
      expression = expression.replaceAll("cosh-1(", "arccosh(");
      expression = expression.replaceAll("tanh-1(", "arctanh(");
      // multiplication for numbers next to brackets or functions
      expression = expression.replaceAllMapped(
        RegExp(r"(\d+(\.\d+)?|\))(?=\()|(\d+(\.\d+)?|\))(?=[a-zA-Z])"),
        (Match m) => "${m[0]}*",
      );

      Expression exp;
      exp = Expression(expression);
      setState(() {
        var eval = exp.eval()!;
        expression = eval.toString().contains(".")
            ? eval.toStringAsFixed(2)
            : eval.toString();
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
                padding: EdgeInsets.only(top: 70, bottom: 10, right: 20),
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
        Column(
          spacing: 0,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // constants
                  Constants(updater: updateExpressionAndClose),
                  // keyboard
                  KeyBoard(
                    updater: updateEquation,
                    delete: deleteLast,
                    clear: clearAll,
                    equality: evaluateExpression,
                  ),
                  // functions
                  Functions(updater: updateExpressionAndClose),
                ],
              ),
            ),
            SizedBox(
              width: 24,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[500],
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.circle, size: 8)),
                  Tab(icon: Icon(Icons.circle, size: 8)),
                  Tab(icon: Icon(Icons.circle, size: 8)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
