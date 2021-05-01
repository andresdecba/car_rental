import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constatnts.dart';
import '../../singleton.dart';

Widget rentalInfo() {
  
  final _servicio = new ServicioSingleton(); // instancia del singletone  
  final _formatDate = new DateFormat('dd-MM-yy'); // es para cambair el formato de la fecha de yyyy-MM-dd a dd-MM-yy
  

  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Column(
      children: [
        _buildInfo(
          icono: Icon(
            Icons.location_on,
            color: kWhite,
          ),
          subtitulo: 'Destino',
          titulo: _servicio.destino,
        ),
        Row(
          children: [

            Expanded( /////// fecha de inicio
              child: ValueListenableBuilder(
                valueListenable:  _servicio.diaINICIO,
                builder: (BuildContext context, DateTime value, Widget child) {
                  return
                  _buildInfo(
                    subtitulo: 'Inicio',
                    titulo: value == null ? '' : DateFormat('dd-MM-yy').format(value), //DateFormat ya lo convierte a String :D
                    icono: Icon( Icons.car_rental, color: kWhite,)
                  );
                },
              ),
            ),
            
            Expanded( /////// fecha de fin
              child: ValueListenableBuilder(
                valueListenable:  _servicio.diaFIN,
                builder: (BuildContext context, DateTime value, Widget child) {
                  return
                  _buildInfo(
                    subtitulo: 'Fin',
                    titulo: value == null ? '' : DateFormat('dd-MM-yy').format(value), //DateFormat ya lo convierte a String :D
                    icono: Icon( Icons.car_rental, color: kWhite,)
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


///////////// construir las cajitas con lka info de cada cosa

Widget _buildInfo({String titulo, String subtitulo, Icon icono}) {

  return
  Container(

    height: 80,
    width: double.infinity,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: kLightGrey,
      border: Border.all(color: kDarkGrey),
      //borderRadius: BorderRadius.circular(20)
    ),

    child: Row(
      children: [

        CircleAvatar(
          backgroundColor: Colors.grey,
          child: icono,
        ),

        SizedBox(
          width: 20,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Text(subtitulo),
            Text(titulo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          ],
        )
      ],
    ),
  );
}
