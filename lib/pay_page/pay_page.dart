import 'package:car_rental/constatnts.dart';
import 'package:car_rental/pay_page/pay_widgets/card_name.dart';
import 'package:car_rental/pay_page/pay_widgets/codigo.dart';
import 'package:car_rental/pay_page/pay_widgets/dni.dart';
import 'package:car_rental/pay_page/pay_widgets/numero_de_tarjeta.dart';
import 'package:car_rental/pay_page/pay_widgets/pay_buttons.dart';
import 'package:car_rental/pay_page/pay_widgets/vencimiento.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/ultima_pagina/ultima_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {

  bool acepto = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: appBar( context, titulo: 'Pagar',),

      body: Padding(
        padding: const EdgeInsets.all(kPaddingSmall),

        child: SingleChildScrollView(

          child: Column(
            children: [       

              /////////////// formularios
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  PayButtons(),
                  SizedBox(height: kPaddingSmall,),
                  NumeroDeTarjeta(),
                  SizedBox(height: kPaddingSmall,),                  
                  NombreCompleto(),
                  SizedBox(height: kPaddingSmall,),
                  DNI(),
                  SizedBox(height: kPaddingSmall,),
                  FechaVencimiento(),
                  SizedBox(height: kPaddingSmall,),
                  CodigoTarjeta(),
                  SizedBox(height: kPaddingSmall,),
                ],
              ),

              ///////////// acepto terminos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox( 
                    value: acepto,
                    onChanged: (data) {
                      setState(() {
                        acepto = data;
                        print('data $data');
                        print('acepto $acepto');
                      });
                    }
                  ),
                  Text('Acepto los términos y condiciones')
                ], 
              ),
              
              /////////// botonardo continuar
              botonGenerico( 
                titulo: 'Pagar y Continuar',
                bgColor: acepto == false ? kDarkGrey : kYellow,
                onPress: (){
                  acepto == false ?
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text('Acepte los terminos para continuar', textAlign: TextAlign.center,),
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(16),
                    )
                  ) :
                  Navigator.push(context, CupertinoPageRoute(builder: (builder) =>UltimaPagina()));
                  //Navigator.pushNamed(context, '/ultimaPagina');
                }  
              ) 
            ],
          ),
        ),
      )
    );
  }
}



