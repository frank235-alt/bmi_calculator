import 'package:flutter/material.dart';

import 'contants.dart';

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild(this.iconChild,this.label);
  final IconData iconChild;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconChild,
          size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(label,style: kLabeltextfile,)
      ],
    );
  }
}
