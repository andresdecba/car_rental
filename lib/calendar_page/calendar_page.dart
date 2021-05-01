import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';

import 'calendar_widgets/calendario.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  final _servicio = new ServicioSingleton();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
        context,
        titulo: 'Seleccione fecha y hora',
      ),
      backgroundColor: kWhite,
      body: SafeArea(
        child: Stack(
          children: [

            _cabecera(altura: screenSize.height), // FOTIS DEL AUTO
                
            ListView(  
            children: [
            SizedBox(height: screenSize.height*0.18,),        
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: kDarkGrey, borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusBig))),
              child: Column(
                children: [        
                  CalendarSelectionRange(),        
                  SizedBox( height: 15,),        
                  rentalInfo(), //actualizar                  
                  SizedBox( height: 15,),        
                  botonGenerico(
                    titulo: 'Continuar',
                    onPress: () {
        
                      _servicio.diaINICIO.value == null && _servicio.diaFIN.value == null ?
        
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content: Text('Seleccione fechas de inicio y fin para continuar', textAlign: TextAlign.center,),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.all(16),
                      )) :
        
                      Navigator.pushNamed(context, '/carSelectionPage');        
                      print(' diaaa inicioo ${_servicio.diaINICIO}');        
                    }
                  )  
                ],
              ),
            ),
          ],
          ),]
        )
      ),
    );
  }
}



Widget _cabecera({double altura}) {
  return SizedBox(
    height: altura * 0.2,
    width: double.infinity,
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(kDarkGrey, BlendMode.colorBurn),
      child: Image.asset(
        //'images/icons/logo.png',
        //'images/auto_portada.png',
        'images/icons/Ruta-40.jpg',
        fit: BoxFit.fitWidth,
        //height: altura * 0.15,
      ),
      
    ),
  );
}