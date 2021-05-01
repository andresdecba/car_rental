import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FechaVencimiento extends StatefulWidget {

  const FechaVencimiento({

    Key key,

  }) : super(key: key);



  @override
  _FechaVencimientoState createState() => _FechaVencimientoState();
}

class _FechaVencimientoState extends State<FechaVencimiento> {
  String get titulo => null;


 // final _clearTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vencimiento',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          TextField(

            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              new CardNumberInputFormatter()
            ],

            //maxLength: 16,
            
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,

            decoration: InputDecoration(
                hintText: '00/00',
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

class CardNumberInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(' / '); // Add double spaces.
      }
    }

    var string = buffer.toString();

    return newValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(offset: string.length)
    );
  }
}