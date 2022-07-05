import 'package:flutter/material.dart';

class MyTextStyles {
  final BuildContext context;
  MyTextStyles(this.context);

  TextStyle get cardTitle => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );

  TextStyle get homeCardValue => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );

  TextStyle get homeCardText => TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );

  TextStyle get resultCardValue => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );

  TextStyle get resultCardText => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle get resultCardUnit => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      );
}
