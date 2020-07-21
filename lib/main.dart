import 'package:macro_calculator/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Macro Calculator',
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }
}
