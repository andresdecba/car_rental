import 'package:flutter/material.dart';
import '../../constatnts.dart';

Widget infoGrid({String info, IconData icon}) {
  return Container(
    decoration: BoxDecoration(color: kBlack.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(4))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Text(info)
      ],
    ),
  );
}