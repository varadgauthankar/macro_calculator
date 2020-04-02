import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_calculator/screens/aboutPage.dart';
import 'package:macro_calculator/screens/resultPage.dart';
import 'package:macro_calculator/screens/settingsPage.dart';
import 'package:macro_calculator/utils/activityLeveltext.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/data/calc.dart';
import 'package:macro_calculator/utils/fieldCheck.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController weightLb = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController heightFeet = TextEditingController();
  TextEditingController heightInch = TextEditingController();

  Color inActiveColor = Colors.grey[850];
  Color activeColor = Colors.redAccent;

  FocusNode _ageNode = FocusNode();
  FocusNode _weightNode = FocusNode();
  FocusNode _heightNode = FocusNode();

  FocusNode _heightFeetNode = FocusNode();
  FocusNode _heightInchNode = FocusNode();

  CheckVal val = CheckVal(false);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  showSnackBar(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.grey[900],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error_outline, color: Colors.white),
          SizedBox(
            width: 8.0,
          ),
          Text(
            message,
            style: mySnackBarText,
          ),
        ],
      ),
      duration: Duration(seconds: 2),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(
                  image: AssetImage('images/icon.png'),
                ),
                accountName: Text(
                  'Macro Calculator',
                  style: myDrawerTitle,
                ),
                accountEmail: Text(
                  'Version: 1.1',
                  style: myVersionText,
                ),
              ),
              ListTile(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPage(val)));
                },
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
                leading: Icon(Icons.info_outline),
                title: Text('About'),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            HapticFeedback.lightImpact();
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              if (isGenderEmpty()) {
                showSnackBar('Please select gender!');
              } else if (isActivityEmpty()) {
                showSnackBar('Please select activity level!');
              } else if (isGoalEmpty()) {
                showSnackBar('Please select goal!');
              } else {
                CalculatorBrain calc = CalculatorBrain(
                    age: double.parse(age.text),
                    height: selectedUnit == Units.metric
                        ? double.parse(height.text)
                        : (double.parse(heightFeet.text) * 30.48 +
                            double.parse(heightInch.text) * 2.54),
                    weight: selectedUnit == Units.metric
                        ? double.parse(weight.text)
                        : double.parse(weightLb.text) / 2.205);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      totalCalories: calc.totalCalories().toStringAsFixed(0),
                      carbs: calc.carb().toStringAsFixed(0),
                      protein: calc.protein().toStringAsFixed(0),
                      fats: calc.fat().toStringAsFixed(0),
                      bmi: calc.bmi(),
                      tdee: calc.tdee().toStringAsFixed(0),
                    ),
                  ),
                );
              }
            }
          },
          label: Text('Calculate'),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Macro Calculator',
            style: myAppbarTitle,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(6),
          child: ListView(
            children: <Widget>[
              MyWrappingContainer(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MyContainerButton(
                        child: Text(
                          'Male',
                          style: myHomeText,
                        ),
                        color: selectedGender == Gender.male
                            ? activeColor
                            : inActiveColor,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: MyContainerButton(
                        child: Text(
                          'Female',
                          style: myHomeText,
                        ),
                        color: selectedGender == Gender.female
                            ? activeColor
                            : inActiveColor,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //                                                           text field

              Form(
                key: _formKey,
                child: MyWrappingContainer(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              hintText: 'Age',
                              lableText: 'Age',
                              suffixText: 'years',
                              controller: age,
                              focusNode: _ageNode,
                              onFieldSubmitted: (_) {
                                fieldFocusChange(
                                    context, _ageNode, _weightNode);
                              },
                            ),
                          ),
                          selectedUnit == Units.metric
                              ? Expanded(
                                  child: MyTextField(
                                    hintText: 'Weight',
                                    lableText: 'Weight',
                                    suffixText: 'kg',
                                    controller: weight,
                                    focusNode: _weightNode,
                                    onFieldSubmitted: (_) {
                                      fieldFocusChange(
                                          context, _weightNode, _heightNode);
                                    },
                                  ),
                                )
                              : Expanded(
                                  child: MyTextField(
                                    hintText: 'Weight',
                                    lableText: 'Weight',
                                    suffixText: 'lb',
                                    controller: weightLb,
                                    focusNode: _weightNode,
                                    onFieldSubmitted: (_) {
                                      fieldFocusChange(context, _weightNode,
                                          _heightFeetNode);
                                    },
                                  ),
                                )
                        ],
                      ),
                      selectedUnit == Units.metric
                          ? MyTextField(
                              hintText: 'Height',
                              lableText: 'Height',
                              suffixText: 'cm',
                              controller: height,
                              focusNode: _heightNode,
                              onFieldSubmitted: (_) {
                                fieldFocusChange(
                                    context, _heightNode, _heightFeetNode);
                              },
                            )
                          : Row(
                              children: <Widget>[
                                Expanded(
                                  child: MyTextField(
                                    hintText: 'Height',
                                    lableText: 'Height',
                                    suffixText: 'feet',
                                    controller: heightFeet,
                                    focusNode: _heightFeetNode,
                                    onFieldSubmitted: (_) {
                                      fieldFocusChange(context, _heightFeetNode,
                                          _heightInchNode);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: MyTextField(
                                    hintText: 'Height',
                                    lableText: 'Height',
                                    suffixText: 'inch',
                                    controller: heightInch,
                                    focusNode: _heightInchNode,
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              //                                                            text field end

              MyWrappingContainer(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MyActivityBars(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              selectedActivityLevel = ActivityLevel.sedentary;
                            });
                          },
                          height: 35,
                          color:
                              selectedActivityLevel == ActivityLevel.sedentary
                                  ? activeColor
                                  : inActiveColor,
                        ),
                        MyActivityBars(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              selectedActivityLevel =
                                  ActivityLevel.lightlyActive;
                            });
                          },
                          height: 55,
                          color: selectedActivityLevel ==
                                  ActivityLevel.lightlyActive
                              ? activeColor
                              : inActiveColor,
                        ),
                        MyActivityBars(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              selectedActivityLevel =
                                  ActivityLevel.moderatelyActive;
                            });
                          },
                          height: 75,
                          color: selectedActivityLevel ==
                                  ActivityLevel.moderatelyActive
                              ? activeColor
                              : inActiveColor,
                        ),
                        MyActivityBars(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              selectedActivityLevel = ActivityLevel.veryActive;
                            });
                          },
                          height: 95,
                          color:
                              selectedActivityLevel == ActivityLevel.veryActive
                                  ? activeColor
                                  : inActiveColor,
                        ),
                        MyActivityBars(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              selectedActivityLevel =
                                  ActivityLevel.extremlyActive;
                            });
                          },
                          height: 115,
                          color: selectedActivityLevel ==
                                  ActivityLevel.extremlyActive
                              ? activeColor
                              : inActiveColor,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        activityLevelText(),
                        style: myActivityLevelText,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              MyWrappingContainer(
                child: Column(
                  children: <Widget>[
                    MyContainerButton(
                      child: Text(
                        'Loose weight',
                        style: myHomeText,
                      ),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          selectedGoal = Goal.looseWeight;
                        });
                      },
                      color: selectedGoal == Goal.looseWeight
                          ? activeColor
                          : inActiveColor,
                    ),
                    MyContainerButton(
                      child: Text(
                        'Maintain weight',
                        style: myHomeText,
                      ),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          selectedGoal = Goal.maintainWeight;
                        });
                      },
                      color: selectedGoal == Goal.maintainWeight
                          ? activeColor
                          : inActiveColor,
                    ),
                    MyContainerButton(
                      child: Text(
                        'Gain weight',
                        style: myHomeText,
                      ),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          selectedGoal = Goal.gainWeight;
                        });
                      },
                      color: selectedGoal == Goal.gainWeight
                          ? activeColor
                          : inActiveColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
