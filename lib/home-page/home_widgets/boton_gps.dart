import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';

Widget botonGps() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:  8.0),
    child: SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kLightGrey),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(BorderSide(color: kDarkGrey)),
        ),
        child: Icon(
          Icons.gps_fixed,
          color: Colors.blueAccent,
        )
      ),
    ),
  );
}
