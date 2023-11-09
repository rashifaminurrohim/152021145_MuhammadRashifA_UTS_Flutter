import 'package:flutter/material.dart';
import 'package:login_signup/logic/appBrain.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/theme/constants_bmi.dart';
import 'package:login_signup/widgets/widgets_bmi.dart/calculate_button.dart';
import 'package:login_signup/widgets/widgets_bmi.dart/myContainer.dart';

class ResultBmi extends StatelessWidget {
  AppBrain calculations;
  ResultBmi({super.key, required this.calculations});

  double bmi = 24.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kResultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              cardColor: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    calculations.getResults().toUpperCase(),
                    style: kResultHeadTextStyle,
                  ),
                  Text(
                    calculations.calculateBMI(),
                    style: kResultBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      calculations.getInterpretations(),
                      style: kResultDescTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            buttonText: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
