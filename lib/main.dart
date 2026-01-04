import "package:flutter/material.dart";
import "homelayout.dart";

MaterialColor primaryColor = Colors.blue;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Solos",
      theme: ThemeData(primarySwatch: primaryColor),
      home: const HomeLayout(),
    );
  }
}
