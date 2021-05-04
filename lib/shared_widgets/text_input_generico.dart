import 'package:flutter/material.dart';
import '../constatnts.dart';

Widget textInput({String titulo, String hintText}) {

  return Padding(
    padding: const EdgeInsets.symmetric( vertical: kPaddingSmallSmall),
    child: TextField(
      onTap: (){},
      decoration: kInputDecoration(
        hintText: 'Abrir mapas',
        suffix: Icon(
          Icons.gps_fixed,
          color: kBlue,
        ),
      )
    ),
  );
}