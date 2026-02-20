import 'package:flutter/material.dart';
import "package:soloapp/calculatorWidgets/button.dart";

class Constants extends StatelessWidget {
  Constants({super.key, required this.updater});

  final Function(String) updater;

  final Map<String, String> constantsMap = {
    "π": "3.14",
    "e": "2.71",
    "φ": "1.61",
    "γ": "0.57",
    "c": "(3x10^8)",
    "G": "(6.67x10^-11)",
    "h": "(6.63x10^-34)",
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
            value: constantsMap.keys.toList()[index],
            onClick: () => updater(constantsMap.values.toList()[index]),
            variety: "numberButton",
            size: 24,
          );
        },
        itemCount: constantsMap.length,
      ),
    );
  }
}
