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
  final double? size;

  const Button({
    super.key,
    required this.value,
    this.value2 = "",
    required this.onClick,
    this.onLongClick,
    required this.variety,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    late Widget result;
    TextStyle style = TextStyle(fontSize: size);
    ButtonStyle numberButtonStyle = ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );

    ButtonStyle symbolButtonStyle = ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      shape: WidgetStatePropertyAll<StadiumBorder>(StadiumBorder()),
    );

    switch (variety) {
      // for numbers
      case "numberButton":
        result = Center(
          child: TextButton(
            onPressed: () {
              onClick();
            },
            style: numberButtonStyle,

            child: Text(value, style: style.copyWith(color: Colors.blueGrey)),
          ),
        );
        break;

      // for symbols
      case "symbolButton":
        result = Center(
          child: ElevatedButton(
            onPressed: () {
              onClick();
            },
            onLongPress: () {
              if (onLongClick != null) {
                onLongClick();
              }
            },
            style: symbolButtonStyle,
            child: Tooltip(
              message: value2,
              verticalOffset: 32,
              preferBelow: false,
              child: Text(value, style: style.copyWith(color: primaryColor)),
            ),
          ),
        );
        break;

      // for equals-to button

      case "equalityButton":
        result = FilledButton(
          onPressed: () {
            onClick();
          },
          style: ButtonStyle(
            padding: WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.only(left: 28, right: 28),
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
