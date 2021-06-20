import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  BottomButton({this.buttonTitle, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          buttonTitle,
          style: kButtonTextStyle,
          textAlign: TextAlign.center,
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
