import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/colors.dart';

class AppBarTitleStyle {
  static const light = TextStyle(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 22.0,
    letterSpacing: 1,
    color: MyColors.black,
  );

  static const dark = TextStyle(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 22.0,
    color: MyColors.white,
    letterSpacing: 1,
  );
}

class TitleStyle {
  static const light = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20.0,
    color: MyColors.black,
  );
  static const dark = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20.0,
    color: MyColors.white,
  );
}

class ValueStyle {
  static const light = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    color: Colors.redAccent,
  );
  static const dark = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    color: Colors.redAccent,
  );
}

class ValueStyleUnit {
  static const light = TextStyle(
    height: 1.3,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: MyColors.black,
  );
  static const dark = TextStyle(
    height: 1.3,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: MyColors.white,
  );
}

class SubtitleStyle {
  static const light = TextStyle(
    color: MyColors.black,
    fontSize: 16.0,
  );
  static const dark = TextStyle(
    color: MyColors.white,
    fontSize: 16.0,
  );
}

class ResultTitleStyle {
  static const light = TextStyle(
    color: MyColors.black,
    height: 1.2,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: 20.0,
  );
  static const dark = TextStyle(
    height: 1.2,
    color: MyColors.white,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: 20.0,
  );
}

class ResultValueStyle {
  static const lightDark = TextStyle(
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.none,
    fontSize: 28.0,
    color: Colors.redAccent,
  );
}

class ResultUnitStyle {
  static const light = TextStyle(
    height: 1,
    decoration: TextDecoration.none,
    fontSize: 12.0,
    color: MyColors.lightGrey,
  );
  static const dark = TextStyle(
    color: MyColors.lightGrey,
    height: 1,
    decoration: TextDecoration.none,
    fontSize: 12.0,
  );
}
