import 'package:flutter/material.dart';

import '../../constatnts.dart';

Widget tile({String titulo, String routeName, BuildContext context, String trailingIcon, bool bold = false}) {

  return InkWell(
    onTap: () {
      //Navigator.pushNamed(context, 'routeName');
    },
    child: ListTile(
      
      title: Text(
        titulo,
        style: TextStyle(color: kBlack, fontWeight: bold == false ? FontWeight.normal : FontWeight.w900),
      ),
      trailing: trailingIcon is String
          ? Text(
              trailingIcon,
              style: TextStyle(color: kBlack, fontWeight: bold == false ? FontWeight.normal : FontWeight.w900),
            )
          : Icon(Icons.arrow_right),
    ),
  );
}
