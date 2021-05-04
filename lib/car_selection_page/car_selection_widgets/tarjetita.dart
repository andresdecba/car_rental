import 'package:flutter/material.dart';
import '../../constatnts.dart';
import '../../models.dart';
import '../../singleton.dart';

Widget tarjetita({AutosModel autosModel, context, Function onTapVerMas, Function onTapRentar}) {

  final _servicio = new ServicioSingleton();

  return Container(

    padding: EdgeInsets.all(kPaddingSmall),
    margin: EdgeInsets.symmetric(vertical: kPaddingSmall/2),
    decoration: kDecoration,

    child: Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible( //////////////////// INFO + FOTO DEL AUTO
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${autosModel.marca}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('${autosModel.modelo}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  Row(
                    // modelo de auto y valoracion
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellow,
                      ),
                      Text(autosModel.valoracion.toString()),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.person_sharp,
                        color: kGrey,
                      ),
                      Text(autosModel.asientos.toString()),
                    ],
                  ),
                ],
              ),
            ),

            Flexible( // imagen del auto
              flex: 3,
              child: Image.asset(
                autosModel.image[0],
                fit: BoxFit.contain,
              )
            )
          ],
        ),

        Divider(),

        Column( ///////////////////////// PRECIOSSS
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Text( // precio por dia
              'Precio por día: ${autosModel.precio}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, )
            ),

            Divider(),

            Text( // precio total a pagar
              'Total a pagar por ${_servicio.diasTOTALES} días: \$ ${autosModel.precio * _servicio.diasTOTALES}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
          ],
        ),

        Divider(),

        Row(  // botones ver mas y rentar
          children: [
            Spacer(),
            _botoncito(onTapVerMas, titulo: 'Ver mas detalles'),
            SizedBox(width: 8,),
            _botoncito(onTapRentar, titulo: 'Rentar Ahora !'),
          ],
        )
      ],
    ),
  );
}

ClipRRect _botoncito(Function onTap, {String titulo}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(kRadiusBig),
    child: GestureDetector(
      onTap: onTap, //() => Navigator.pushNamed(context, '/carDetailsPage'),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: kYellow,
        child: Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
