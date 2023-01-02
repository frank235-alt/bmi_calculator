import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:bmi_calcultor/reuseable_card.dart';
import 'bottton_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String iterpretation;
  ResultPage(this.bmiResult,this.resultText,this.iterpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULTOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(15.0),
            child: Text('Your Result',style: kTitleTextStyle,),
          ),),
          Expanded(
            flex: 5,
              child: ReusableCard(
                kInActiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),style: kResultTextStyle,),
                    Text(bmiResult,style: kBMITextStyle,),
                    Text(iterpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ),),
          BottomButton(() {
            Navigator.pop(context);
          }, 'Re-Calculate')
        ],
      ),

    );
  }
}
