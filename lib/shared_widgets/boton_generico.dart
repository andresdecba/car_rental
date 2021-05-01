import 'package:flutter/material.dart';
import '../constatnts.dart';


ElevatedButton botonGenerico({ String titulo, Function onPress, Color bgColor, Color textColor }){

  return
  ElevatedButton(

    

    onPressed: onPress,  
    
    style: ButtonStyle(
      backgroundColor: bgColor == null ? MaterialStateProperty.all(kYellow) : MaterialStateProperty.all(bgColor),
      foregroundColor: textColor == null ? MaterialStateProperty.all(kBlack) : MaterialStateProperty.all(textColor),
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 55)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusSmall))),

    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titulo, textAlign: TextAlign.center,),
        //SizedBox(width: 12,),
        //Icon(Icons.arrow_forward_ios, size: 17,)
      ],
    )
  );
}