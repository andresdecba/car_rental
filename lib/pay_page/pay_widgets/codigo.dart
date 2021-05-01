import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodigoTarjeta extends StatefulWidget {

  const CodigoTarjeta({

    Key key,
  }) : super(key: key);

  @override
  _CodigoTarjetaState createState() => _CodigoTarjetaState();
}

class _CodigoTarjetaState extends State<CodigoTarjeta> {
  String get titulo => null;

  @override
  Widget build(BuildContext context) {

    return
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Código',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          TextField(

            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],

            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,

            decoration: InputDecoration(
                hintText: '000',
                hintStyle: TextStyle(color: kLightGrey),

                suffixIcon: Icon(
                  Icons.check_circle_outline,
                  color: kDarkGrey,
                ),
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadiusSmall), borderSide: BorderSide(color: kYellow))),
          )

        ],
      ),
    );
  }
}
