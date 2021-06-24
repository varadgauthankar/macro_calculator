import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/helpers.dart';
import 'package:macro_calculator/utils/textStyles.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color color;
  const MyButton({Key key, this.onTap, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
        elevation: 3,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style:
                    isThemeDark(context) ? TitleStyle.dark : TitleStyle.light,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
