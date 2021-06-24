import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/colors.dart';
import 'package:macro_calculator/utils/helpers.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'package:macro_calculator/widgets/result_tile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
    ScreenshotController screenshotController = ScreenshotController();
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
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(6.0),
          children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                color:
                    isThemeDark(context) ? MyColors.darkGrey : MyColors.white,
                child: Column(
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
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'share',
        child: Icon(Icons.share_outlined),
        foregroundColor: MyColors.black,
        onPressed: () => shareScreenshot(screenshotController),
      ),
    );
  }

  void shareScreenshot(ScreenshotController key) async {
    var unit8List = await key.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/img.png');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path],
        text: 'Calculated from Macro Calculator.\n' +
            'download now: https://play.google.com/store/apps/details?id=com.varadgauthankar.macro_calculator');
  }
}
