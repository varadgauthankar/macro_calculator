import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/colors.dart';
import 'package:macro_calculator/utils/helpers.dart';

class Tile extends StatelessWidget {
  final Widget child;
  const Tile({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: isThemeDark(context)
            ? getOverLayColor(context, MyColors.darkGrey)
            : Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
