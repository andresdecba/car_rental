import 'package:flutter/material.dart';
import '../constatnts.dart';


AppBar appBar( context, {String titulo, bgColor = kYellow}){

  return
  AppBar(
    title: Text(titulo, style: TextStyle(color: Colors.black),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios, color: bgColor==kBlack ? kWhite : kBlack,)
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: bgColor,
    elevation: 0,
  );
}