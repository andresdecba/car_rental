import 'package:car_rental/calendar_page/calendar_page.dart';
import 'package:car_rental/car_Details/car_details_page.dart';
import 'package:car_rental/car_selection_page/car_selection_page.dart';
import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/home-page/home_page.dart';
import 'package:car_rental/pay_page/pay_page.dart';
import 'package:car_rental/ultima_pagina/ultima_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  //para que la fecha del calendario se vea en español usamos 'initializeDateFormatting().then()'
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      

      debugShowCheckedModeBanner: false,
      title: 'Alquiler de autos',
      theme: ThemeData(
        fontFamily: 'Exo',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/carSelectionPage': (context) => CarSelectionPage(),
        '/calendarPage': (context) => CalendarPage(),
        '/carDetailsPage': (context) => CarDetailsPage(),
        '/confirmationsPage': (context) => ConfirmationPage(),
        '/payPage': (context) => PayPage(),
        '/ultimaPagina': (context) => UltimaPagina(),
      },
    );
  }
}
