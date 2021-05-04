import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import '../../models.dart';
import '../../singleton.dart';

class BotonDesplegable extends StatefulWidget {
  BotonDesplegable();

  @override
  _BotonDesplegableState createState() => _BotonDesplegableState();
}

class _BotonDesplegableState extends State<BotonDesplegable> {
  List<String> dropdownValue = ciudades;
  String mostrarValor;

  final _servicio = new ServicioSingleton();

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: kDecoration,
      padding: EdgeInsets.symmetric(horizontal: kPaddingSmall),
      margin: EdgeInsets.symmetric(vertical: kPaddingSmallSmall),

      child: DropdownButton(

        hint: Text('Seleccionar'),
        value: mostrarValor,
        icon: const Icon(Icons.arrow_downward),
        style: const TextStyle(color: kBlack, fontFamily: 'Exo'),
        isExpanded: true,

        underline: Opacity(opacity: 1),

        onChanged: (newValue) {
          setState(() {
            mostrarValor = newValue;
            _servicio.destino = newValue;
            print('destino::: $mostrarValor'); //destino elegido
            print('destino singletone::: ${_servicio.destino}'); //destino singleton
          });
        },

        items: ciudades.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
