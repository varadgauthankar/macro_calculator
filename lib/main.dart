import 'package:macro_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Macro Calculator',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
        brightness: Brightness.light,
      ),
    );
  }
}
