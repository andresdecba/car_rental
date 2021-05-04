import 'package:car_rental/calendar_page/calendar_page.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/shared_widgets/text_input_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widgets/boton_desplegable.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _servicio = new ServicioSingleton();
    final _screen = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: kWhite,
      body: SafeArea(

        child: ListView(
          children: [
        
            //////////////////// PARTE SUPERIOR AMARILLA ////////////////////
            Container(
              padding: EdgeInsets.all(kPaddingBig),
              color: kYellow,
              width: double.infinity,
              height: _screen.height / 2.2,
              child: Column(  
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'images/auto_portada.png', width: 220,),
                  Text(
                    'BIENVENIDO A',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'SNAP AUTO RENTAL',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Alquila un auto para tu próximo viaje !',
                    style: TextStyle(fontWeight: FontWeight.normal, height: 2),
                  ),
                ],
              ),
            ),
            
            //////////////////// PARTE DE ABAJO TEXT FIELDS ////////////////////
            Container(
              color: kYellow,
              child: Container(
                padding: EdgeInsets.all(kPaddingBig),
                decoration: kDecoration2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( 'Seleccione una ciudad', ),
                    BotonDesplegable(),
                    SizedBox(height: 3,),
                    Text( 'o encuentre la agencia mas cercana',),
                    textInput(),
                    botonGenerico(
                      titulo: 'continuar',
                      onPress: () {
                        _servicio.destino == '' ?
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                            content: Text('Seleccione un destino para continuar', textAlign: TextAlign.center,),
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.all(16),
                            )
                          ) :
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context){ return CalendarPage(); }));
                      }
                    ),          
                  ],
                ),
              ),
            ),
          ],  
        ),
      ),
    );
  }
}

