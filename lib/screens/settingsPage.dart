import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_calculator/utils/enums.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';
import 'package:macro_calculator/utils/launchUrl.dart';
import 'package:macro_calculator/utils/textStyles.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.val);
  final CheckVal val;

  @override
  _SettingsPageState createState() => _SettingsPageState(val);
}

class _SettingsPageState extends State<SettingsPage> {
  _SettingsPageState(this.val);
  CheckVal val;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: myAppbarTitle,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'General settings',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 14,
                  color: Colors.redAccent,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6.0, left: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Use imperial unit',
                          style: TextStyle(
                            fontFamily: 'RoboMono',
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Show pounds(lb) instead of Kg',
                          style: TextStyle(
                            fontFamily: 'RoboMono',
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                        activeColor: Colors.redAccent,
                        value: val.value,
                        onChanged: (bool value) {
                          setState(() {
                            print(val.value);
                            val.value = value;
                            val.value == true
                                ? selectedUnit = Units.imperial
                                : selectedUnit = Units.metric;
                          });
                        })
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'Policies',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 14,
                  color: Colors.redAccent,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6.0, left: 6.0),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    launchUrl(privacyPolicy);
                  },
                  child: Container(
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontFamily: 'RoboMono',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
