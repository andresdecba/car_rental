import 'package:flutter/material.dart';
import '../../constatnts.dart';

Widget infoGrid({String info, IconData icon}) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(color: kBlack.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(4))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20,),        
        Text(info)
      ],
    ),
  );
}