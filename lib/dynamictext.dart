import 'package:flutter/material.dart';

class Dynamictext extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? align;

  const Dynamictext({super.key, required this.text, this.style, this.align});

  @override
  State<Dynamictext> createState() => _DynamictextState();
}

class _DynamictextState extends State<Dynamictext> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: widget.style, textAlign: widget.align);
  }
}
