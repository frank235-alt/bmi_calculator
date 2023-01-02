import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton(@required this.icon,this.onPressed);

  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints:  BoxConstraints(minWidth: 90.0, minHeight: 40.0),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed:onPressed,);

  }
}

