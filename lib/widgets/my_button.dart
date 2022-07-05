import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/helpers.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool selected;
  const MyButton({Key key, this.onTap, this.title, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: selected
            ? colorScheme(context).primary
            : colorScheme(context).secondary,
        elevation: 3,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge.copyWith(
                      color: selected
                          ? colorScheme(context).onPrimary
                          : colorScheme(context).onSecondary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
