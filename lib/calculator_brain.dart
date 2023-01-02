import 'dart:math';



class CalculatorBrain{
  CalculatorBrain(this.height,this.weight);
  final int height;
  final int weight;

  double get _bmi => weight / pow(height / 100, 2);
  String calcBMI() => _bmi.toStringAsFixed(1);

  String getResult(){
    final bmi=this._bmi;
    if(bmi>=25){
      return 'Overweight';
    }else if(bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }

  }
  String getInterpretation(){
    final bmi=this._bmi;
    if(bmi>=25){
      return 'You have a heigher than body weight. Try to exercise more';
    }else if(bmi>18.5){
      return 'you have a normal body weight.Good job';
    }else{
      return 'You have a lower than normal body weight. Try to eat a bit more';
    }

  }
}
