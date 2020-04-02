import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';
import 'package:macro_calculator/utils/textStyles.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.totalCalories,
    @required this.carbs,
    @required this.protein,
    @required this.fats,
    @required this.bmi,
    @required this.tdee,
  });

  final String totalCalories;
  final String carbs;
  final String protein;
  final String fats;
  final double bmi;
  final String tdee;

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
        appBar: AppBar(
          title: Text(
            'Results',
            style: myAppbarTitle,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyWrappingContainer(
                child: ResultContainer(
                  title: 'Total Calories',
                  amount: totalCalories,
                  unit: 'kcals',
                ),
              ),
              MyWrappingContainer(
                child: Column(
                  children: <Widget>[
                    ResultContainer(
                      title: 'Carbs',
                      amount: carbs,
                      unit: 'g',
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: ResultContainer(
                          title: 'Proteins',
                          amount: protein,
                          unit: 'g',
                        )),
                        Expanded(
                            child: ResultContainer(
                          title: 'Fats',
                          amount: fats,
                          unit: 'g',
                        )),
                      ],
                    )
                  ],
                ),
              ),
              MyWrappingContainer(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ResultContainer(
                      title: 'BMI',
                      amount: bmi.toStringAsFixed(1),
                      unit: '',
                    )),
                    Expanded(
                        child: Container(
                      height: 70,
                      margin: EdgeInsets.all(6.0),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[850],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'TDEE',
                                style: myResultTitle,
                              ),
                              SizedBox(width: 4.0),
                              GestureDetector(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 20.0,
                                ),
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  showSnackBar(
                                      'Total Daily Energy Expenditure');
                                  //show snackbar
                                },
                              )
                            ],
                          ),

                          // SizedBox(height: 2.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                tdee,
                                style: myResultAmount,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                'kcals',
                                style: myResultUnit,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
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
