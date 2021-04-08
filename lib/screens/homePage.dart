import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:macro_calculator/screens/resultPage.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/utils/dynamaicTheme.dart';
import 'package:macro_calculator/data/calc.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final blockVertical = mediaQuery.size.height / 100;
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.check),
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
      body: Column(
        children: <Widget>[
          // App title
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 12.0, right: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Hero(
                  tag: "appBarTitle",
                  child: Text(
                    "Macro Calculator",
                    style: isThemeDark(context)
                        ? TitleTextStyles.dark
                        : TitleTextStyles.light,
                  ),
                ),
                IconButton(
                    iconSize: 22.0,
                    icon: Icon(
                      isThemeDark(context)
                          ? FontAwesomeIcons.solidSun
                          : FontAwesomeIcons.solidMoon,
                    ),
                    onPressed: () {
                      DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark);
                    })
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Hero(
                            tag: "topContainer",
                            child: Material(
                              type: MaterialType.transparency,
                              child: SingleChildScrollView(
                                child: MyContainerTile(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 6),
                                              child: Material(
                                                color: selectedGender ==
                                                        Gender.male
                                                    ? activeColor
                                                    : isThemeDark(context)
                                                        ? inActiveColorDark
                                                        : inActiveColor,
                                                elevation: 4.0,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shadowColor: Colors.grey,
                                                child: InkWell(
                                                  splashColor: Colors.redAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: Container(
                                                    height: blockVertical * 5.5,
                                                    child: Center(
                                                        child: Text(
                                                      "Male",
                                                      style:
                                                          isThemeDark(context)
                                                              ? HomeTitleStyle
                                                                  .dark
                                                              : HomeTitleStyle
                                                                  .light,
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGender =
                                                          Gender.male;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 6),
                                              child: Material(
                                                color: selectedGender ==
                                                        Gender.female
                                                    ? activeColor
                                                    : isThemeDark(context)
                                                        ? inActiveColorDark
                                                        : inActiveColor,
                                                elevation: 4.0,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shadowColor: Colors.grey,
                                                child: InkWell(
                                                  splashColor: Colors.redAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: Container(
                                                    height: blockVertical * 5.5,
                                                    child: Center(
                                                        child: Text(
                                                      "Female",
                                                      style:
                                                          isThemeDark(context)
                                                              ? HomeTitleStyle
                                                                  .dark
                                                              : HomeTitleStyle
                                                                  .light,
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGender =
                                                          Gender.female;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //! height slider
                                      Container(
                                        margin: EdgeInsets.all(6),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Height",
                                                  style: isThemeDark(context)
                                                      ? HomeTitleStyle.dark
                                                      : HomeTitleStyle.light,
                                                ),
                                                Text(
                                                  "${height.toStringAsFixed(0)} cm",
                                                  style: isThemeDark(context)
                                                      ? TextUnitStyle.dark
                                                      : TextUnitStyle.light,
                                                ),
                                              ],
                                            ),
                                            SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                activeTrackColor: activeColor,
                                                inactiveTrackColor:
                                                    inActiveColor,
                                                trackShape:
                                                    CustomTrackShape(), //RoundedRectSliderTrackShape(),
                                                trackHeight: 8.0,
                                                thumbColor: Colors.redAccent,
                                                thumbShape:
                                                    RoundSliderThumbShape(
                                                        enabledThumbRadius:
                                                            12.0),
                                                overlayColor:
                                                    Colors.red.withAlpha(32),
                                              ),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Slider(
                                                  min: 100,
                                                  max: 220,
                                                  value: height,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      String val = value
                                                          .toStringAsFixed(0);
                                                      height =
                                                          double.parse(val);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      //! weight slider
                                      Container(
                                        margin: EdgeInsets.all(6),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Weight",
                                                  style: isThemeDark(context)
                                                      ? HomeTitleStyle.dark
                                                      : HomeTitleStyle.light,
                                                ),
                                                Text(
                                                  "${weight.toStringAsFixed(0)} kg",
                                                  style: isThemeDark(context)
                                                      ? TextUnitStyle.dark
                                                      : TextUnitStyle.light,
                                                ),
                                              ],
                                            ),
                                            SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                activeTrackColor: activeColor,
                                                inactiveTrackColor:
                                                    inActiveColor,
                                                trackShape:
                                                    CustomTrackShape(), //RoundedRectSliderTrackShape(),
                                                trackHeight: 8.0,
                                                thumbColor: Colors.redAccent,
                                                thumbShape:
                                                    RoundSliderThumbShape(
                                                        enabledThumbRadius:
                                                            12.0),
                                                overlayColor:
                                                    Colors.red.withAlpha(32),
                                              ),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Slider(
                                                  min: 20,
                                                  max: 140,
                                                  value: weight,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      String val = value
                                                          .toStringAsFixed(0);
                                                      weight =
                                                          double.parse(val);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // age number picker
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Age",
                                                  style: isThemeDark(context)
                                                      ? HomeTitleStyle.dark
                                                      : HomeTitleStyle.light,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      HorizantalPicker(
                                        minValue: 5,
                                        maxValue: 80,
                                        divisions: 75,
                                        showCursor: true,
                                        backgroundColor: isThemeDark(context)
                                            ? Colors.grey[800]
                                            : Colors.white,
                                        initialPosition: InitialPosition.center,
                                        activeItemTextColor: Colors.redAccent,
                                        onChanged: (value) {
                                          setState(() {
                                            age = value;
                                          });
                                        },
                                      ),
                                      //SizedBox(height: 12)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //! second container
                          Hero(
                            tag: "bottomContainer",
                            child: Material(
                              type: MaterialType.transparency,
                              child: SingleChildScrollView(
                                child: MyContainerTile(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Activity level",
                                        style: isThemeDark(context)
                                            ? HomeTitleStyle.dark
                                            : HomeTitleStyle.light,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: DropdownButton<String>(
                                          value: activityLevelValue,
                                          icon:
                                              Icon(FontAwesomeIcons.caretDown),
                                          iconSize: 18,
                                          elevation: 4,
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
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: isThemeDark(context)
                                                    ? TextUnitStyle.dark
                                                    : TextUnitStyle.light,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Goal",
                                        style: isThemeDark(context)
                                            ? HomeTitleStyle.dark
                                            : HomeTitleStyle.light,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: DropdownButton<String>(
                                          value: goalValue,
                                          icon:
                                              Icon(FontAwesomeIcons.caretDown),
                                          iconSize: 18,
                                          elevation: 4,
                                          underline: Container(
                                            height: 3,
                                            color: Colors.redAccent,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              goalValue = newValue;
                                            });
                                          },
                                          items: goals
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: isThemeDark(context)
                                                    ? TextUnitStyle.dark
                                                    : TextUnitStyle.light,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
