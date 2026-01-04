import 'package:flutter/material.dart';

MaterialColor primaryColor = Colors.blue;
MaterialAccentColor accentColor = Colors.blueAccent;

// A  button widget used in the calculator app
class Button extends StatelessWidget {
  final String value;
  final String value2;
  final Function() onClick;
  final String variety;
  final dynamic onLongClick;

  const Button({
    super.key,
    required this.value,
    this.value2 = "",
    required this.onClick,
    this.onLongClick,
    required this.variety,
  });

  @override
  Widget build(BuildContext context) {
    late Widget result;
    TextStyle style = TextStyle(fontSize: 24);
    ButtonStyle buttonStyle = ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    );
    switch (variety) {
      // for numbers
      case "numberButton":
        result = TextButton(
          onPressed: () {
            onClick();
          },
          style: buttonStyle,

          child: Text(value, style: style.copyWith(color: Colors.blueGrey)),
        );
        break;

      // for symbols
      case "symbolButton":
        result = ElevatedButton(
          onPressed: () {
            onClick();
          },
          onLongPress: () {
            if (onLongClick != null) {
              onLongClick();
            }
          },
          // style: buttonStyle,
          child: Text(value, style: style.copyWith(color: primaryColor)),
        );
        break;

      // for cancel button

      case "equalityButton":
        result = FilledButton(
          onPressed: () {
            onClick();
          },
          style: ButtonStyle(
            padding: WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.only(left: 28, right: 28, top: 12, bottom: 12),
            ),

            backgroundColor: WidgetStatePropertyAll<Color>(primaryColor),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          child: Text(value, style: style.copyWith(color: Colors.white)),
        );
        break;
      default:
        result = Text("Unknown Button");
    }

    return result;
  }
}
