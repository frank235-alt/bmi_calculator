import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calcultor/reuseable_card.dart';
import 'package:bmi_calcultor/reuseable_card_child.dart';
import 'contants.dart';
import 'package:bmi_calcultor/result_page.dart';
import 'bottton_button.dart';
import 'package:bmi_calcultor/round_button.dart';
import 'calculator_brain.dart';




enum Gender{
  male,
  female
}


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

      Color maleColoursCards=kInActiveCardColour;
      Color femaleColoursCards=kInActiveCardColour;
      int height=180;
      int weight=60;
      int age=15;
      void updateColour(selectedGender){
        if (selectedGender==Gender.male){
          if(maleColoursCards==kInActiveCardColour){
            maleColoursCards=kActiveColourPallet;
            femaleColoursCards=kInActiveCardColour;
            print('tapp in right');
          }else{
            maleColoursCards=kInActiveCardColour;
          }
        }
        if(selectedGender==Gender.female){
          if(femaleColoursCards==kInActiveCardColour){
            femaleColoursCards=kActiveColourPallet;
            maleColoursCards=kInActiveCardColour;
            print('tapp in left');

          }else{
          femaleColoursCards=kInActiveCardColour;
          }
        }
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[ Expanded(
          child: Row(
            children:<Widget>[ Expanded(
              child: GestureDetector(
                onTap: (){
                  setState((){
                   updateColour(Gender.male);
                  });
                },
                child: ReusableCard(

                maleColoursCards,
                ReusableCardChild(FontAwesomeIcons.mars,"male"),),
              ),
            ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState((){
                      updateColour(Gender.female);
                    },);
                  },
                  child: ReusableCard(
                   femaleColoursCards,
                    ReusableCardChild(FontAwesomeIcons.venus,"female"),),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: ReusableCard(
          kInActiveCardColour,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HEIGHT',style: kLabeltextfile,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(height.toString(),style:kTextStyleCard,),
                  Text('cm',style: kLabeltextfile,)

                ],
              ),
              SliderTheme(
                data: SliderThemeData().copyWith(
                  overlayColor: Color(0x29EB1555),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0)

                ),
                child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 250.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState((){
                        height=newValue.round();
                      });
                }
                ),
              )
            ],
          ),

        ),
        ),
          Expanded(
            child: Row(
              children:<Widget>[ Expanded(
                child: ReusableCard(
                  kInActiveCardColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style: kLabeltextfile,),
                      Text(weight.toString(),
                      style: kTextStyleCard,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          Expanded(
                            child: RoundIconButton(
                                FontAwesomeIcons.plus,
                              (){
                                  setState(() {
                                    weight++;
                                  });
                              }
                            ),),

                          Expanded(child: RoundIconButton(
                              FontAwesomeIcons.minus,
                              (){
                                setState(() {
                                  weight--;
                                });
                              }
                          ),),
                        ]
                      )

                    ],
                  )
                  ),
              ),
                Expanded(
                  child: ReusableCard(kInActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text('Age',style: kLabeltextfile,),
                      Text(age.toString(),style: kTextStyleCard,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: RoundIconButton(FontAwesomeIcons.plus,
                                  () {
                              setState((){
                                age++;
                              },);
                            },),
                          ),
                          RoundIconButton(FontAwesomeIcons.minus,
                                  () {
                            setState((){
                              age--;
                            },);
                                  },),

                        ],
                      )
    ],

                      )
                    ),),
              ],
            ),
          ),
        BottomButton(
                (){
                  CalculatorBrain cal=CalculatorBrain(height, weight);

              Navigator.push(context, MaterialPageRoute(builder:( context)=>ResultPage(
                cal.getResult(),
                cal.calcBMI(),
                cal.getInterpretation(),
              ),),);
            },
          "Calculate",

        ),],
      ),

    );
  }
}

