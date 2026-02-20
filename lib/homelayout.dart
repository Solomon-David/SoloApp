import 'package:flutter/material.dart';

import "home/home.dart";
import "calculator.dart";

MaterialColor primaryColor = Colors.blue;
MaterialAccentColor accentColor = Colors.blueAccent;
double small = 8;
double medium = 16;

Color white = Colors.white;

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  //current index
  String _current = "/calculator";

  //list of screens
  final Map<String, Widget> _screens = {
    "/calculator": CalculatorWidget(),
    "/default": const HomeWidget(),
  };

  //list of routes
  List<String> get _routes => _screens.keys.toList();

  void _goto(String route) {
    setState(() {
      _current = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Solos",
          style: TextStyle(color: Colors.white, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: _screens[_current],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _routes.indexOf(_current),
        onTap: (int index) {
          _goto(_routes[index]);
        },
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculator",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        ],
      ),
    );
  }
}
