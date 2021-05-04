import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/shared_widgets/boton_generico.dart';
import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_details_widgets/grid_info.dart';
import 'card_details_widgets/images_slider.dart';

class CarDetailsPage extends StatelessWidget {

  const CarDetailsPage({
    this.recibirDatos
  });

  final AutosModel recibirDatos;

  @override
  Widget build(BuildContext context) {

    final screerSize = MediaQuery.of(context).size;

    return SafeArea(

      child: Scaffold(  
        appBar: appBar( context, titulo: 'Caracteristicas técnicas'),
        body: ListView(
          children: [
            //detalles del auto
            _mitadSuperior(altura: screerSize.height, context: context, recibirDatos: recibirDatos),
            // cuadrito datos de ciudad, inicio y fin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
              child: rentalInfo(),
            ),
            // boton continuar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingBig),                
              child: botonGenerico(
                titulo: 'Rentar este modelo',
                onPress: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (builder) => ConfirmationPage( recibirDatos:  recibirDatos ) ));
                }
              ),
            ),
            //espacio abajo
            SizedBox(height: kPaddingBig,)
          ],
        )
      ),
    );
  }
}

Widget _mitadSuperior({altura, context, AutosModel recibirDatos}) {

  final _servicio = ServicioSingleton();

  return Container(  
    padding: EdgeInsets.all(kPaddingSmall),
    decoration: BoxDecoration(color: kYellow, borderRadius: BorderRadius.vertical(bottom: Radius.circular(kRadiusBig))),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImagesSlider( recibirDatos: recibirDatos, ),
        Text(
          '${recibirDatos.marca} ${recibirDatos.modelo}'
          , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.5)
        ),
        Container( // construir grilla de info
          height: 75,
          margin: EdgeInsets.symmetric(vertical: kPaddingSmall),
          alignment: Alignment.center,
          child: GridView.count(
            semanticChildCount: 2,
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              infoGrid(info: '${recibirDatos.maletas.toString()} maletas', icon: Icons.cases),
              infoGrid(info: '${recibirDatos.asientos.toString()} asientos', icon: Icons.event_seat),
              infoGrid(info: '${recibirDatos.valoracion.toString()} rating', icon: Icons.star),
              infoGrid(info: '${recibirDatos.xmodel.toString()} model', icon: Icons.car_repair),
              infoGrid(info: '${recibirDatos.velocidad.toString()} km/h', icon: Icons.speed),
              GestureDetector(onTap: () {}, child: infoGrid(info: 'mas info', icon: Icons.more_horiz)),  
            ],
          ),
        ),
        Align(  // precio por dia
          alignment: Alignment.centerLeft,
          child: Text(
          'Precio por día: \$ ${recibirDatos.precio}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, )
          )
        ),
        Align( // total a pagar por todos los dias
          alignment: Alignment.centerLeft,
          child: Text(
          'Total a pagar por ${_servicio.diasTOTALES} días: \$ ${recibirDatos.precio * _servicio.diasTOTALES}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, )
          )
        ),
        SizedBox(height: kPaddingSmall,)
      ],
    ),
  );
}
