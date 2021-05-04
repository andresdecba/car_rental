import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:car_rental/car_selection_page/car_selection_page.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
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

    return Scaffold(

      appBar: appBar(
        context,
        titulo: 'Seleccione fecha y hora',
      ),

      backgroundColor: kLightGrey,

      body: SafeArea(

        child: ListView(  
          padding: EdgeInsets.all(kPaddingSmall),

          children: [
          
            Column(
              children: [        
                CalendarSelectionRange(),
                rentalInfo(),                
                botonGenerico(
                  titulo: 'Continuar',
                  onPress: () {
                  
                    _servicio.diaINICIO.value == null && _servicio.diaFIN.value == null ?

                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text('Seleccione fechas de inicio y fin para continuar', textAlign: TextAlign.center,),
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.all(16),
                    )) :
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context){ return CarSelectionPage(); }));
                    //Navigator.pushNamed(context, '/carSelectionPage');        
                    print(' diaaa inicioo ${_servicio.diaINICIO}');        
                  }
                )  
              ],
            ),
          ],
        )
      ),
    );
  }
}