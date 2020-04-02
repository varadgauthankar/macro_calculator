import 'package:macro_calculator/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:macro_calculator/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.redAccent,
          canvasColor: Colors.black,
        ),
        home: SplashScreen());
  }
}
