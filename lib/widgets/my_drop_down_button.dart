import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:macro_calculator/utils/helpers.dart';
import 'package:macro_calculator/utils/textStyles.dart';

//! i have no idea how to dynamically pass enum :(
//! so had to create two seperate classes :'(

class MyDropDownButtonActivityLevel extends StatelessWidget {
  final ActivityLevel value;
  final Function(ActivityLevel) onChanged;

  const MyDropDownButtonActivityLevel({Key key, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: DropdownButton<ActivityLevel>(
        value: value,
        icon: Icon(EvaIcons.arrowDown),
        elevation: 3,
        underline: Container(
          height: 3,
          color: Colors.redAccent,
        ),
        onChanged: onChanged,
        items: ActivityLevel.values
            .map<DropdownMenuItem<ActivityLevel>>((ActivityLevel value) {
          return DropdownMenuItem<ActivityLevel>(
            value: value,
            child: Text(
              value.toString().split('.').last.firstCapital() + ' Active',
              style: isThemeDark(context)
                  ? SubtitleStyle.dark
                  : SubtitleStyle.light,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MyDropDownButtonGoal extends StatelessWidget {
  final Goal value;
  final Function(Goal) onChanged;

  const MyDropDownButtonGoal({Key key, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: DropdownButton<Goal>(
        value: value,
        icon: Icon(EvaIcons.arrowDown),
        elevation: 3,
        underline: Container(
          height: 3,
          color: Colors.redAccent,
        ),
        onChanged: onChanged,
        items: Goal.values.map<DropdownMenuItem<Goal>>((Goal value) {
          return DropdownMenuItem<Goal>(
            value: value,
            child: Text(
              value.toString().split('.').last.firstCapital() + ' Weight',
              style: isThemeDark(context)
                  ? SubtitleStyle.dark
                  : SubtitleStyle.light,
            ),
          );
        }).toList(),
      ),
    );
  }
}
