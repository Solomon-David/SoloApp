// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  Function(int) clickCallback;
  final MaterialColor background;
  final Widget child;

  FloatingButton({
    super.key,
    required this.background,
    required this.child,
    required this.clickCallback,
  });

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Child calls the parent callback
        widget.clickCallback(++value);
      },
      backgroundColor: widget.background,
      child: widget.child,
    );
  }
}
