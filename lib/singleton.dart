import 'package:flutter/material.dart';

class ServicioSingleton {


  static final ServicioSingleton _singleton = new ServicioSingleton._internal();

  factory ServicioSingleton() {
    return _singleton;
  }

  ServicioSingleton._internal();

  String destino = '';
  String modelo = 'modelo auto';

  //DateTime diaINICIO;
  //DateTime diaFIN;

  final ValueNotifier<DateTime> diaINICIO = ValueNotifier(null);
  final ValueNotifier<DateTime> diaFIN = ValueNotifier(null);
  int diasTOTALES = 0;
  //final ValueNotifier<int> diasTOTALES2 = ValueNotifier(null);




  
}
