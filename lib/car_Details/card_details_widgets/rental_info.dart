import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constatnts.dart';
import '../../singleton.dart';

Widget rentalInfo() {
  
  final _servicio = new ServicioSingleton(); // instancia del singletone    

  return Padding(

    padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(kRadiusSmall),  
      
      child: Column(
        children: [

          _buildInfo(
            icono: Icon( Icons.location_on, color: kWhite ),
            subtitulo: 'Destino',
            titulo: _servicio.destino,
          ),

          Row(
            children: [
              ValueListenableBuilder(
                valueListenable:  _servicio.diaINICIO,
                builder: (BuildContext context, DateTime value, Widget child) {
                  return
                  Expanded(
                    child: _buildInfo(
                      subtitulo: 'Inicio',
                      titulo: value == null ? '' : DateFormat('dd-MM-yy').format(value), //DateFormat ya lo convierte a String :D
                      icono: Icon( Icons.car_rental, color: kWhite,)
                    ),
                  );
                },
              ),
              
              ValueListenableBuilder(
                valueListenable:  _servicio.diaFIN,
                builder: (BuildContext context, DateTime value, Widget child) {
                  return
                  Expanded(
                    child: _buildInfo(
                      subtitulo: 'Fin',
                      titulo: value == null ? '' : DateFormat('dd-MM-yy').format(value), //DateFormat ya lo convierte a String :D
                      icono: Icon( Icons.car_rental, color: kWhite,)
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


///////////// construir las cajitas con lka info de cada cosa

Widget _buildInfo({String titulo, String subtitulo, Icon icono}) {

  return
  Container(

    padding: EdgeInsets.all(kPaddingSmall),
    decoration: BoxDecoration(
      color: kLightGrey,
      border: Border.all(color: kDarkGrey),
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        CircleAvatar(
          backgroundColor: Colors.grey,
          child: icono,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [            
            Text(subtitulo),
            Text(titulo, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        )

      ],
    ),
  );
}
