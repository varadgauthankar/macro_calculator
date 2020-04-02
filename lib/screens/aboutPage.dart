import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:macro_calculator/utils/launchUrl.dart';
import 'package:macro_calculator/utils/extractedWidgets.dart';
import 'package:flutter/services.dart';
import 'package:macro_calculator/utils/textStyles.dart';

// TODO: add privacy policy , wrap evrything in safearea

class AboutPage extends StatelessWidget {
  final Icon myHeart = Icon(FontAwesomeIcons.heart);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'About',
            style: myAppbarTitle,
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(6),
          child: ListView(
            children: <Widget>[
              MyWrappingContainer(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 2.0),
                      Image(
                        image: AssetImage('images/icon.png'),
                        width: 80.0,
                        height: 80.0,
                        filterQuality: FilterQuality.low,
                      ),
                      SizedBox(height: 8.0),
                      Center(
                        child: Text(
                          'Macro Calculator',
                          style: myAboutHeader,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Macro Calculator is a simple application that calculates your optimal macronutrients and calories based on your age, height, weight, gender, and activity level.',
                        style: myHomeText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.0),
                      MyIconButton(
                        icon: FontAwesomeIcons.googlePlay,
                        color: Colors.greenAccent,
                        url: storeUrl,
                      ),
                      SizedBox(height: 4.0),
                    ],
                  ),
                ),
              ),
              MyWrappingContainer(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/me.jpeg'),
                          radius: 35.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 5.0, left: 8.0),
                            child: Icon(
                              Icons.code,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          Text(
                            'with',
                            style: myHomeText,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                          Text(
                            'by',
                            style: myHomeText,
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          'Varad Gauthankar',
                          style: myAboutHeader,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyIconButton(
                            icon: FontAwesomeIcons.twitter,
                            color: Colors.lightBlue,
                            url: twitterUrl,
                          ),
                          MyIconButton(
                            icon: FontAwesomeIcons.instagram,
                            color: Colors.pinkAccent,
                            url: instaUrl,
                          ),
                          MyIconButton(
                            icon: FontAwesomeIcons.telegram,
                            color: Colors.blueAccent,
                            url: telegramUrl,
                          ),
                          MyIconButton(
                            icon: FontAwesomeIcons.solidEnvelope,
                            color: Colors.redAccent,
                            url: mailUrl,
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
      ),
    );
  }
}
