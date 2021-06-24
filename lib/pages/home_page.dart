import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:macro_calculator/pages/results_page.dart';
import 'package:macro_calculator/utils/colors.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:macro_calculator/utils/helpers.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/data/calc.dart';
import 'package:macro_calculator/widgets/my_button.dart';
import 'package:macro_calculator/widgets/slider.dart';
import 'package:macro_calculator/widgets/tile.dart';
import 'package:numberpicker/numberpicker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color inActiveColor = Colors.grey[200];
  Color inActiveColorDark = Colors.grey[600];
  Color activeColor = Colors.redAccent;

  double age = 18, weight = 60, height = 170;

  List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremly Active'
  ];
  List<String> goals = ['Lose Weight', 'Maintain Weight', 'Gain Weight'];

  String activityLevelValue = 'Moderately Active';
  String goalValue = 'Lose Weight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isThemeDark(context) ? MyColors.darkGrey : MyColors.white,
      appBar: AppBar(
        backgroundColor:
            isThemeDark(context) ? MyColors.darkGrey : MyColors.white,
        elevation: 0,
        title: Text(
          "Macro Calculator",
          style: isThemeDark(context)
              ? AppBarTitleStyle.dark
              : AppBarTitleStyle.light,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isThemeDark(context) ? EvaIcons.sun : EvaIcons.moon,
              color: isThemeDark(context) ? MyColors.white : MyColors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(6.0),
        children: [
          Tile(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                        title: 'Male',
                        onTap: () {},
                      ),
                    ),
                    spacer(width: 12),
                    Expanded(
                      child: MyButton(
                        title: 'Female',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),

                spacer(height: 12),

                //! height slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Height",
                      style: isThemeDark(context)
                          ? TitleStyle.dark
                          : TitleStyle.light,
                    ),
                    Row(
                      children: [
                        Text(
                          "${height.toStringAsFixed(0)}",
                          style: isThemeDark(context)
                              ? ValueStyle.dark
                              : ValueStyle.light,
                        ),
                        Text(
                          " cm",
                          style: isThemeDark(context)
                              ? ValueStyleUnit.dark
                              : ValueStyleUnit.light,
                        ),
                      ],
                    ),
                  ],
                ),
                MyCustomSlider(
                  value: height,
                  min: 100,
                  max: 220,
                  onChanged: (value) {},
                ),

                //! weight slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Weight",
                      style: isThemeDark(context)
                          ? TitleStyle.dark
                          : TitleStyle.light,
                    ),
                    Row(
                      children: [
                        Text(
                          "${weight.toStringAsFixed(0)}",
                          style: isThemeDark(context)
                              ? ValueStyle.dark
                              : ValueStyle.light,
                        ),
                        Text(
                          " cm",
                          style: isThemeDark(context)
                              ? ValueStyleUnit.dark
                              : ValueStyleUnit.light,
                        ),
                      ],
                    ),
                  ],
                ),
                MyCustomSlider(
                  value: weight,
                  min: 40,
                  max: 150,
                  onChanged: (value) {},
                ),
                // age number picker
                Text(
                  "Age",
                  style:
                      isThemeDark(context) ? TitleStyle.dark : TitleStyle.light,
                ),
                Center(
                  child: NumberPicker(
                    minValue: 12,
                    maxValue: 80,
                    itemCount: 7,
                    itemWidth: 50,
                    textStyle: isThemeDark(context)
                        ? SubtitleStyle.dark
                        : SubtitleStyle.light,
                    selectedTextStyle: ResultValueStyle.lightDark,
                    value: age.toInt(),
                    axis: Axis.horizontal,
                    onChanged: (value) {
                      setState(() {
                        age = value.toDouble();
                      });
                    },
                  ),
                )
              ],
            ),
          ),

          //! second container
          Tile(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Activity level",
                  style:
                      isThemeDark(context) ? TitleStyle.dark : TitleStyle.light,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: DropdownButton<String>(
                    value: activityLevelValue,
                    icon: Icon(EvaIcons.arrowDown),
                    elevation: 3,
                    underline: Container(
                      height: 3,
                      color: Colors.redAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        activityLevelValue = newValue;
                      });
                    },
                    items: activityLevels
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: isThemeDark(context)
                              ? SubtitleStyle.dark
                              : SubtitleStyle.light,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Goal",
                  style:
                      isThemeDark(context) ? TitleStyle.dark : TitleStyle.light,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: DropdownButton<String>(
                    value: goalValue,
                    icon: Icon(EvaIcons.arrowDown),
                    elevation: 3,
                    underline: Container(
                      height: 3,
                      color: Colors.redAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        goalValue = newValue;
                      });
                    },
                    items: goals.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: isThemeDark(context)
                              ? SubtitleStyle.dark
                              : SubtitleStyle.light,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(EvaIcons.checkmark),
        onPressed: () {
          selectedActivityLevel = getActivityLevel();
          selectedGoal = getGoal();

          CalculatorBrain calc = CalculatorBrain(
            age: age,
            height: height,
            weight: weight,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                totalCalories: calc.totalCalories(),
                carbs: calc.carb(),
                protein: calc.protein(),
                fats: calc.fat(),
                bmi: calc.bmi(),
                tdee: calc.tdee(),
              ),
            ),
          );
        },
      ),
    );
  }

  ActivityLevel getActivityLevel() {
    if (activityLevelValue == "Sedentary")
      return ActivityLevel.sedentary;
    else if (activityLevelValue == "Lightly Active")
      return ActivityLevel.lightlyActive;
    else if (activityLevelValue == "Moderately Active")
      return ActivityLevel.moderatelyActive;
    else if (activityLevelValue == "Very Active")
      return ActivityLevel.veryActive;
    else if (activityLevelValue == "Extremly Active")
      return ActivityLevel.extremlyActive;
    else
      return null;
  }

  Goal getGoal() {
    if (goalValue == "Lose Weight")
      return Goal.looseWeight;
    else if (goalValue == "Maintain Weight")
      return Goal.maintainWeight;
    else if (goalValue == "Gain Weight")
      return Goal.gainWeight;
    else
      return null;
  }
}
