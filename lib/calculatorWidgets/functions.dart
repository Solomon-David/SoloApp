import 'package:flutter/material.dart';
import 'package:soloapp/calculatorWidgets/button.dart';

class Functions extends StatelessWidget {
  Functions({super.key, required this.updater});

  final Function(String) updater;

  final Map<String, List<String>> functionMap = {
    "(": ["("],
    ")": [")"],
    "x^y": ["^"],
    "10^x": ["10^"],
    "√": ["√"],
    "!": ["!"],
    "log(": ["log("],
    "ln(": ["ln("],
    "e^x": ["^"],
    "sin(": ["sin(", "sin-1("],
    "cos(": ["cos(", "cos-1("],
    "tan(": ["tan(", "tan-1("],
    "sinh(": ["sinh(", "sinh-1("],
    "cosh(": ["cosh(", "cosh-1("],
    "tanh(": ["tanh(", "tanh-1("],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Button(
            value: functionMap.keys.toList()[index],
            onClick: () => updater(functionMap.values.toList()[index][0]),
            onLongClick: () => updater(functionMap.values.toList()[index][1]),
            // ignore: prefer_if_null_operators
            value2:
                functionMap.values.toList()[index][functionMap.values
                            .toList()[index]
                            .length >
                        1
                    ? 1
                    : 0],
            variety: "symbolButton",
            size: 18,
          );
        },
        itemCount: functionMap.length,
      ),
    );
  }
}
