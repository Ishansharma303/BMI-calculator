import 'package:bmi_calculator/Input_page.dart';
import 'package:bmi_calculator/Reusable_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'package:bmi_calculator/Bottom_Button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bMIResult,
      @required this.getInterpretation,
      @required this.getResult});
  final String getInterpretation;
  final String getResult;
  final String bMIResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCards(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(getResult, style: kResultTextStyle),
                  Text(
                    bMIResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    getInterpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            buttonTitle: 're-calculate',
          )
        ],
      ),
    );
  }
}
