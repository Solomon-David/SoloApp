import 'package:flutter/material.dart';
import 'package:soloapp/calculatorWidgets/button.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({
    super.key,
    required this.updater,
    required this.delete,
    required this.clear,
    required this.equality,
  });

  final Function(String) updater;
  final Function() delete;
  final Function() clear;
  final Function() equality;

  final double colSpacing = 16.0;
  final double rowSpacing = 20.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: Column(
        spacing: colSpacing,
        children: [
          Row(
            spacing: rowSpacing,
            children: [
              //Numerical Buttons
              Button(
                value: '(',
                onClick: () => updater("("),
                variety: "symbolButton",
              ),
              Button(
                value: ')',
                onClick: () => updater(")"),
                variety: "symbolButton",
              ),

              Button(
                value: '÷',
                onClick: () => updater("÷"),
                variety: "symbolButton",
              ),
              Button(
                value: 'C',
                onClick: () => delete(),
                onLongClick: () => clear(),
                variety: "symbolButton",
              ),
            ],
          ),
          Row(
            spacing: rowSpacing,
            children: [
              //Numerical Buttons
              Button(
                value: '7',
                onClick: () => updater("7"),
                variety: "numberButton",
              ),
              Button(
                value: '8',
                onClick: () => updater("8"),
                variety: "numberButton",
              ),
              Button(
                value: '9',
                onClick: () => updater("9"),
                variety: "numberButton",
              ),
              Button(
                value: '-',
                onClick: () => updater("-"),
                variety: "symbolButton",
              ),
            ],
          ),
          Row(
            spacing: rowSpacing,
            children: [
              //Numerical Buttons
              Button(
                value: '4',
                onClick: () => updater("4"),
                variety: "numberButton",
              ),
              Button(
                value: '5',
                onClick: () => updater("5"),
                variety: "numberButton",
              ),
              Button(
                value: '6',
                onClick: () => updater("6"),
                variety: "numberButton",
              ),
              Button(
                value: '+',
                onClick: () => updater("+"),
                variety: "symbolButton",
              ),
            ],
          ),
          Row(
            spacing: rowSpacing,
            children: [
              //Numerical Buttons
              Button(
                value: '1',
                onClick: () => updater("1"),
                variety: "numberButton",
              ),
              Button(
                value: '2',
                onClick: () => updater("2"),
                variety: "numberButton",
              ),
              Button(
                value: '3',
                onClick: () => updater("3"),
                variety: "numberButton",
              ),
              Button(
                value: 'x',
                onClick: () => updater("x"),
                variety: "symbolButton",
              ),
            ],
          ),
          Row(
            spacing: rowSpacing,
            children: [
              //Numerical Buttons
              Button(
                value: '%',
                onClick: () => updater("%"),
                variety: "numberButton",
              ),
              Button(
                value: '0',
                onClick: () => updater("0"),
                variety: "numberButton",
              ),
              Button(
                value: '.',
                onClick: () => updater("."),
                variety: "numberButton",
              ),
              Button(
                value: '=',
                onClick: () => equality(),
                variety: "equalityButton",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
