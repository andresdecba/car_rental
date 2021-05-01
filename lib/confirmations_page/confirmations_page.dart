import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/material.dart';
import 'confirmations_widgets/tile.dart';

class ConfirmationPage extends StatelessWidget {

  const ConfirmationPage( {this.recibirDatos} );

  final AutosModel recibirDatos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, titulo: 'Confirmar reserva'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPaddingBig),
            child: Column(
              children: [

                resumen( recibirDatos ),

                SizedBox(
                  height: 15,
                ),

                _resumenDeLaOrden(recibirDatos: recibirDatos ),
                
                SizedBox(
                  height: 15,
                ),

                _completeConSusDatos(context),

                SizedBox(
                  height: 15,
                ),

                botonGenerico(
                  bgColor: kYellow,
                  titulo: 'Confirmar y pagar',
                  onPress: () => Navigator.pushNamed(context, '/payPage'))
              ],
            ),
          ),
        ),
      ),
    );
  }  
}

Widget resumen ( AutosModel recibirDatos ){

  final _servicio = ServicioSingleton();

  return
  Column(
    children: [
      tile(
        titulo: 'Modelo:',
        trailingIcon: '${recibirDatos.marca} ${recibirDatos.modelo}', // precio x dia * cant de dias
      ),
      Divider( height: 2, thickness: 2 ),
      tile(
        titulo: 'Total de dias:',
        trailingIcon: '${_servicio.diasTOTALES}',
      ),
      Divider( height: 2, thickness: 2 ),  
      tile(
        titulo: 'Destino:',
        trailingIcon: '${_servicio.destino}',
      )
    ],
  );
}

DecoratedBox _resumenDeLaOrden( {AutosModel recibirDatos, }) {

  final _servicio = ServicioSingleton();

  int _precioBase = recibirDatos.precio * _servicio.diasTOTALES;
  double _gastosMasAccesorios = (recibirDatos.precio * _servicio.diasTOTALES) / 8 .toInt().truncate();
  double _depositoReintegrable = (recibirDatos.precio * _servicio.diasTOTALES) / 4 .toInt().truncate();
  double _totalAPagar = _precioBase + _gastosMasAccesorios + _depositoReintegrable.toInt().truncate();
  

  return DecoratedBox(

    decoration: BoxDecoration(
                    border: Border.all(color: kBlue, width: 1, style: BorderStyle.solid),
                    color: kWhite,
                    borderRadius: BorderRadius.circular(kRadiusSmall),
                  ),

    child: Column(
      children: [
        
        Container( // titulo en azul
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusSmall))),
          child: Center(
              child: Text(
            'Resumen de su orden a pagar',
            style: TextStyle(fontSize: 18, color: kWhite),
          )),
        ),
        
        Padding( // info
          padding: EdgeInsets.symmetric(horizontal: kPaddingBig),
          child: Column(
            children: [
              tile(
                titulo: 'Precio base',
                trailingIcon: '\$ $_precioBase', // precio x dia * cant de dias
              ),
              Divider(
                height: 2,
              ),
              tile(
                titulo: 'Gastos + accesrios',
                trailingIcon: '\$ $_gastosMasAccesorios',
              ),
              Divider(
                height: 2,
              ),
              tile(
                titulo: 'Deposito reintegrable',
                trailingIcon: '\$ $_depositoReintegrable',
              ),
              Divider(
                height: 2,
              ),
              tile(
                titulo: 'Total a pagar',
                trailingIcon: '\$ $_totalAPagar', bold: true
              ),
            ],
          ),
        )
      ],
    ),
  );
}

DecoratedBox _completeConSusDatos(BuildContext context) {
  return DecoratedBox(
    decoration: kDecoration,
    child: Column(

      children: [

        Container( // titulo en azul
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: kDarkGrey, borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusSmall))),
          child: Center(
              child: Text(
            'Complete con sus datos personales',
            style: TextStyle(fontSize: 18, color: kBlack),
          )),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox( height: 10,),
              datosPersonales('Nombre y apellido'),
              datosPersonales('Nacionalidad'),
              datosPersonales('DNI'),
              datosPersonales('Fecha de naciemiento'),
              datosPersonales('Teléfono'),
              datosPersonales('eMail', action: TextInputAction.done),
              SizedBox( height: 10,),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget datosPersonales ( String hinttext, {TextInputAction action = TextInputAction.next} ){

  return
  Container(
    padding: EdgeInsets.symmetric(horizontal: kPaddingSmall),
    height: 60,
    child: TextField(
      textInputAction: action,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: kGrey, fontStyle: FontStyle.italic),
      ),
    ),
  );
}