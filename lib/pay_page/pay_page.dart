import 'package:car_rental/constatnts.dart';
import 'package:car_rental/pay_page/pay_widgets/card_name.dart';
import 'package:car_rental/pay_page/pay_widgets/codigo.dart';
import 'package:car_rental/pay_page/pay_widgets/dni.dart';
import 'package:car_rental/pay_page/pay_widgets/numero_de_tarjeta.dart';
import 'package:car_rental/pay_page/pay_widgets/pay_buttons.dart';
import 'package:car_rental/pay_page/pay_widgets/vencimiento.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
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
      appBar: appBar(
        context,
        titulo: 'Pagar',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPaddingSmall),
        child: SingleChildScrollView(
          reverse: true, // es para que no haya overflow al momento de abrir el teclado
          child: Column(
            children: [
              Container(
                decoration: kDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(kPaddingSmall),
                  child: Column(
                    children: [

                      PayButtons(),  /////// botones elegir tarjeta

                      SizedBox(
                        height: 8,
                      ),

                      NumeroDeTarjeta(),
                      NombreCompleto(),
                      DNI(),

                      Row(
                        children: [
                          Expanded(child: FechaVencimiento( ) ),//textInput( titulo: 'Fecha vencimiento', hintText: '00/00' )), ///// fecha vencimiento
                          SizedBox( width: 8 ),
                          Expanded(child: CodigoTarjeta() ),//textInput( titulo: 'Código', hintText: '000' )), //// codigo tarjeta
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox( ///////////// acepto terminos
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
              SizedBox(
                height: 10,
              ),

              botonGenerico( ///// botonardo continuar
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
                  Navigator.pushNamed(context, '/ultimaPagina');
                }  
              ) 
            ],
          ),
        ),
      )
    );
  }
}



