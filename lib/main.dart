import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/MainApp.dart';

void main() => runApp(Main());


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      title: "Back Bench Developers",
      debugShowCheckedModeBanner: false,
      color: kGrayBackground,
      home: MainApp(),
    );
  }
}
