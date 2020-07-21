import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/utils/dynamaicTheme.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.totalCalories,
    @required this.carbs,
    @required this.protein,
    @required this.fats,
    @required this.bmi,
    @required this.tdee,
  });

  final double totalCalories;
  final double carbs;
  final double protein;
  final double fats;
  final double bmi;
  final double tdee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //app bar
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 10.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(FontAwesomeIcons.angleLeft),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Hero(
                      tag: "appBarTitle",
                      child: Text(
                        "Results",
                        style: isThemeDark(context)
                            ? TitleTextStyles.dark
                            : TitleTextStyles.light,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Material(
                    type: MaterialType.transparency,
                    child: Hero(
                      tag: "topContainer",
                      child: MyContainerTile(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ResultContainer(
                              title: "Total Calories",
                              value: "${totalCalories.toStringAsFixed(0)}",
                              units: " kcals",
                            ),
                            ResultContainer(
                              title: "Carbs",
                              value: "${carbs.toStringAsFixed(0)}",
                              units: " g",
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: ResultContainer(
                                    title: "Protein",
                                    value: "${protein.toStringAsFixed(0)}",
                                    units: " g",
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: ResultContainer(
                                    title: "Fats",
                                    value: "${fats.toStringAsFixed(0)}",
                                    units: " g",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "bottomContainer",
                    child: Material(
                      type: MaterialType.transparency,
                      child: MyContainerTile(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ResultContainer(
                                title: "BMI",
                                value: "${bmi.toStringAsFixed(1)}",
                                units: "",
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ResultContainer(
                                title: "TDEE",
                                value: "${tdee.toStringAsFixed(0)}",
                                units: " Kcals",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
