import 'package:flutter/material.dart';
import '../constatnts.dart';


ElevatedButton botonGenerico({ String titulo, Function onPress, Color bgColor, Color textColor }){

  return
  ElevatedButton( 

    onPressed: onPress,
    
    style: ButtonStyle(
      backgroundColor: bgColor == null ? MaterialStateProperty.all(kYellow) : MaterialStateProperty.all(bgColor),
      foregroundColor: textColor == null ? MaterialStateProperty.all(kBlack) : MaterialStateProperty.all(textColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusSmall))),
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titulo, textAlign: TextAlign.center,),
      ],
    )
  );
}