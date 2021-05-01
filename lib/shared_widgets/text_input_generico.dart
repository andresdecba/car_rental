import 'package:flutter/material.dart';

import '../constatnts.dart';

Widget textInput({String titulo, String hintText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        TextField(
          //keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: kLightGrey),
              suffixIcon: Icon(
                Icons.check_circle_outline,
                color: kDarkGrey,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadiusSmall), borderSide: BorderSide(color: kYellow))),
        )
      ],
    ),
  );
}