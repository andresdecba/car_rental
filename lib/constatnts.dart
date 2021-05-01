
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kYellow = Color(0xFFFBD508);
const Color kWhite = Colors.white;
Color kDarkGrey = Colors.grey[300];
Color kDarkGrey2 = Colors.grey;

const Color kBlack = Colors.black;
Color kLightGrey = Colors.grey[100];
const Color kGrey = Colors.grey;

const Color kBlue = Colors.blue;



const double kPaddingBig = 25;
const double kPaddingSmall = 15;


const double kRadiusBig = 20;
const double kRadiusSmall = 10;

List <BoxShadow> kSombra =  [BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  )];

var kDecorationWithShadow = BoxDecoration(
                    border: Border.all(color: kDarkGrey, width: 1, style: BorderStyle.solid),
                    color: kWhite,
                    borderRadius: BorderRadius.circular(kRadiusSmall),
                    boxShadow: kSombra,
                  );

var kDecoration = BoxDecoration(
                    border: Border.all(color: kDarkGrey, width: 1, style: BorderStyle.solid),
                    color: kWhite,
                    borderRadius: BorderRadius.circular(kRadiusSmall),
                  );