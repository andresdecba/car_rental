import 'package:car_rental/constatnts.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/shared_widgets/text_input_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_widgets/boton_desplegable.dart';
import 'home_widgets/boton_gps.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);

    return Scaffold(
        //resizeToAvoidBottomInset: true,
        backgroundColor: kYellow,
        body: SingleChildScrollView(
          reverse: true, // es para que no haya overflow al momento de abrir el teclado
          child: Column(
            children: [
              _parteSuperior(screenSize, context),
              _parteInferior(screenSize, context),
              //Text('data')
            ],
          ),
        ));
  }
}

Widget _parteInferior(screenSize, context) {

  final _servicio = new ServicioSingleton();

  return ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    child: Container(
      height: screenSize.size.height * 0.4,
      width: double.infinity,
      color: kWhite,
      padding: EdgeInsets.all(kPaddingBig),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Seleccione una ciudad',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              BotonDesplegable(),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(flex: 4, child: textInput(titulo: '... ó encuentre la oficina mas cercana')),
              SizedBox(
                width: 8,
              ),
              Expanded(flex: 1, child: botonGps())
            ],
          ),
          SizedBox(
            height: 8,
          ),
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
              Navigator.pushNamed(context, '/calendarPage'); 
            }
          ),
        ],
      ),
    ),
  );
}

Widget _parteSuperior(screenSize, context) {
  return Container(
    height: screenSize.size.height * 0.6,
    width: double.infinity,
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(kPaddingBig),
              height: 300,
              child: Image.asset(
                'images/auto_portada.png',
              )
            ),
            Container(
              child: Column(
                children: [

                  Text(
                    'BIENVENIDO A',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'SNAP AUTO RENTAL',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'Alquila un auto para tu próximo viaje !',
                    style: TextStyle(fontWeight: FontWeight.bold, height: 2),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
