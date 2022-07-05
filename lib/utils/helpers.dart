import 'package:flutter/material.dart';

Color getOverLayColor(BuildContext context, Color color) {
  return Color.alphaBlend(ElevationOverlay.overlayColor(context, 1), color);
}

Widget spacer({double height = 0, double width = 0}) {
  return SizedBox(height: height, width: width);
}

bool isThemeDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark ? true : false;
}

ColorScheme colorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

extension stringExtension on String {
  String firstCapital() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
