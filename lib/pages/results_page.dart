import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/colors.dart';
import 'package:macro_calculator/utils/helpers.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/widgets/result_tile.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    this.totalCalories,
    this.carbs,
    this.protein,
    this.fats,
    this.bmi,
    this.tdee,
    this.bmiScale,
  });

  final double totalCalories;
  final double carbs;
  final double protein;
  final double fats;
  final double bmi;
  final double tdee;
  final String bmiScale;

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
          "Results",
          style: isThemeDark(context)
              ? AppBarTitleStyle.dark
              : AppBarTitleStyle.light,
        ),
        leading: IconButton(
          icon: Icon(EvaIcons.arrowIosBack),
          color: isThemeDark(context) ? MyColors.white : MyColors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(6.0),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ResultTile(
                title: "Total Calories",
                value: "${totalCalories.toStringAsFixed(0)}",
                units: "KCALS",
              ),
              ResultTile(
                title: "Carbs",
                value: "${carbs.toStringAsFixed(0)}",
                units: "GRAMS",
              ),
              Row(
                children: [
                  Expanded(
                    child: ResultTile(
                      title: "Protein",
                      value: "${protein.toStringAsFixed(0)}",
                      units: "GRAMS",
                    ),
                  ),
                  Expanded(
                    child: ResultTile(
                      title: "Fats",
                      value: "${fats.toStringAsFixed(0)}",
                      units: "GRAMS",
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ResultTile(
                  title: "BMI",
                  value: "${bmi.toStringAsFixed(1)}",
                  units: bmiScale,
                ),
              ),
              Expanded(
                child: ResultTile(
                  title: "TDEE",
                  value: "${tdee.toStringAsFixed(0)}",
                  units: "KCALS",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
