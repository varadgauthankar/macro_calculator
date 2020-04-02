import 'package:flutter/material.dart';
import 'package:macro_calculator/utils/textStyles.dart';
import 'launchUrl.dart';

import 'package:flutter/services.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({this.icon, this.url, this.color});

  final IconData icon;
  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          launchUrl(url);
        });
  }
}

class ResultContainer extends StatelessWidget {
  ResultContainer(
      {@required this.title, @required this.amount, @required this.unit});
  final String title;
  final String amount;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            title,
            style: myResultTitle,
          ),
          // SizedBox(height: 2.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                amount,
                style: myResultAmount,
              ),
              SizedBox(width: 3.0),
              Text(
                unit,
                style: myResultUnit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentNode, FocusNode nextNode) {
  currentNode.unfocus();
  FocusScope.of(context).requestFocus(nextNode);
}

class MyActivityBars extends StatelessWidget {
  const MyActivityBars({this.height, this.color, this.onTap});

  final double height;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(6),
        width: 50.0,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    this.suffixText,
    this.lableText,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final String suffixText;
  final String lableText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.redAccent,
        decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle: mySuffixText,
          hintText: lableText,
          hintStyle: myTexFieldText,
          labelText: hintText,
          labelStyle: myTexFieldText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter details';
          }
          return null;
        },
        onTap: () {
          HapticFeedback.lightImpact();
        },
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class MyContainerButton extends StatelessWidget {
  const MyContainerButton({this.child, this.color, this.onTap});
  final Widget child;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.all(6),
        child: Center(child: child),
        height: 40.0,
      ),
    );
  }
}

class MyWrappingContainer extends StatelessWidget {
  const MyWrappingContainer({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(6),
      child: child,
    );
  }
}
