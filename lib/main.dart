import 'package:flutter/material.dart';
import 'package:bmi_calculator/Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111428),
        scaffoldBackgroundColor: Color(0xFF111428),
      ),
      home: InputPage(),
    );
  }
}
