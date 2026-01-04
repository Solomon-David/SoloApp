import "package:flutter/material.dart";
import "floatingbutton.dart";

MaterialColor primaryColor = Colors.blue;
MaterialAccentColor accentColor = Colors.blueAccent;
double small = 8;
double medium = 16;

Color white = Colors.white;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int times = 0;

  void _incrementCounter(int value) {
    setState(() {
      times = value;
    });
    print("clicked $value times");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Welcome, User.",
              style: TextStyle(color: Colors.black87, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "My first Flutter app.",
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text("Pressed $times times", textAlign: TextAlign.center),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingButton(
                background: primaryColor,
                clickCallback: _incrementCounter,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
