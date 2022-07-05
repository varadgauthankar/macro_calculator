import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:macro_calculator/utils/helpers.dart';

class MyDropDown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final Function(T) onChanged;
  const MyDropDown({Key key, this.value, this.items, this.onChanged})
      : super(key: key);

  String _getText(T value) {
    return value.toString().split('.').last.firstCapital();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: DropdownButton<T>(
        value: value,
        icon: Icon(EvaIcons.arrowDown),
        elevation: 3,
        underline: Container(
          height: 3,
          color: Theme.of(context).colorScheme.primary,
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              T == ActivityLevel
                  ? _getText(value) + ' active'
                  : _getText(value) + ' weight',
            ),
          );
        }).toList(),
      ),
    );
  }
}
