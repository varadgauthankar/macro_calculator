import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Widget child;
  const Tile({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
