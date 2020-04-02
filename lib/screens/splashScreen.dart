import 'package:flutter/material.dart';
import 'dart:async';
import 'package:macro_calculator/screens/homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/icon.png'),
                        width: 150.0,
                        height: 150.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'Macro calculator',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontSize: 20.0),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
