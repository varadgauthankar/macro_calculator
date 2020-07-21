import 'package:flutter/material.dart';

class TitleTextStyles {
  TitleTextStyles({this.size});
  final double size;

  static const light = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 22.0,
    decoration: TextDecoration.none,
    color: Colors.black,
  );

  static const dark = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 22.0,
    decoration: TextDecoration.none,
    color: Colors.white,
  );
}

class HomeTitleStyle {
  static const light = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontSize: 20.0,
    color: Colors.black,
  );
  static const dark = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontSize: 20.0,
    color: Colors.white,
  );
}

class ResultTitleStyle {
  static const light = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: 20.0,
    color: Colors.black,
  );
  static const dark = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: 20.0,
    color: Colors.white,
  );
}

class TextValueStyle {
  static const light = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontSize: 18.0,
    color: Colors.black,
  );
  static const dark = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontSize: 18.0,
    color: Colors.white,
  );
}

class TextUnitStyle {
  static const light = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontSize: 16.0,
    color: Colors.black,
  );
  static const dark = TextStyle(
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontSize: 16.0,
    color: Colors.white,
  );
}
