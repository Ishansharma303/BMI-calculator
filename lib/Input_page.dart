import 'dart:ui';
import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Icon_Content.dart';
import 'Reusable_cards.dart';
import 'constants.dart';
import 'result_page.dart';
import 'Round_Button_icon.dart';
import 'package:bmi_calculator/Bottom_Button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderSelection {
  Male,
  Female,
}

class _InputPageState extends State<InputPage> {
  GenderSelection selectedGender;
  int height = 180;
  int weight = 22;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI calculator',
            style: TextStyle(
              fontFamily: ('Nunito'),
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCards(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderSelection.Male;
                        });
                      },
                      colour: selectedGender == GenderSelection.Male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Gender(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCards(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderSelection.Female;
                        });
                      },
                      colour: selectedGender == GenderSelection.Female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Gender(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCards(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                ' cm',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 1.5,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xff8d8e98),
                              thumbColor: Color(0xffeb1555),
                              overlayColor: Color(0x65eb1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 16.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 24.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 122.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCards(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCards(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'calculate',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bMIResult: calc.calculateBMI(),
                              getResult: calc.getResult(),
                              getInterpretation: calc.getInterpretation(),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
