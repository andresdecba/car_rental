import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/pay_page/pay_page.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
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
            padding: const EdgeInsets.all(kPaddingSmall),
            child: Column(
              children: [

                resumen( recibirDatos ),
                _resumenDeLaOrden(recibirDatos: recibirDatos ),
                _completeConSusDatos(context),
                botonGenerico(
                  bgColor: kYellow,
                  titulo: 'Confirmar y pagar',
                  onPress: () => Navigator.push(context, CupertinoPageRoute(builder: (builder) => PayPage())) //() => Navigator.pushNamed(context, '/payPage')
                )
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
      Divider(height: 0.5,),
      tile(
        titulo: 'Total de dias:',
        trailingIcon: '${_servicio.diasTOTALES}',
      ),
      Divider(height: 0.5,),
      tile(
        titulo: 'Destino:',
        trailingIcon: '${_servicio.destino}',
      )
    ],
  );
}

Widget _resumenDeLaOrden( {AutosModel recibirDatos, }) {

  final _servicio = ServicioSingleton();

  int _precioBase = recibirDatos.precio * _servicio.diasTOTALES;
  double _gastosMasAccesorios = (recibirDatos.precio * _servicio.diasTOTALES) / 8 .toInt().truncate();
  double _depositoReintegrable = (recibirDatos.precio * _servicio.diasTOTALES) / 4 .toInt().truncate();
  double _totalAPagar = _precioBase + _gastosMasAccesorios + _depositoReintegrable.toInt().truncate();
  
  return Container(
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
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
              Divider(height: 0.5,),  
              tile(
                titulo: 'Gastos + accesrios',
                trailingIcon: '\$ $_gastosMasAccesorios',
              ),
              Divider(height: 0.5,),  
              tile(
                titulo: 'Deposito reintegrable',
                trailingIcon: '\$ $_depositoReintegrable',
              ),
              Divider(height: 0.5,),
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

Widget _completeConSusDatos(BuildContext context) {

  return Container(
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
    decoration: kDecoration,
    child: Column(
      children: [
        
        Container( // titulo en gris
          height: 50,
          decoration: BoxDecoration(color: kDarkGrey, borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusSmall))),
          child: Center(
              child: Text(
            'Complete con sus datos personales',
            style: TextStyle(fontSize: 18, color: kBlack),
          )),
        ),

        Padding( // campos de texto
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