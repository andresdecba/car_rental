import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumeroDeTarjeta extends StatefulWidget {
  const NumeroDeTarjeta({
    Key key,
  }) : super(key: key);

  @override
  _NumeroDeTarjetaState createState() => _NumeroDeTarjetaState();
}

class _NumeroDeTarjetaState extends State<NumeroDeTarjeta> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Número de tarjeta',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          TextField(
            controller: _controller,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(20),
              new CardNumberInputFormatter(),
            ],
            
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: '0000 0000 0000 0000 0000',
              hintStyle: TextStyle(color: kLightGrey),

              //suffixIcon: buffer.length < 20 ? Icon(Icons.check_circle_outline, color: kDarkGrey,) : Icon(Icons.check_circle_outline, color: kYellow,),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadiusSmall), borderSide: BorderSide(color: kYellow))
            )
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
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();

    return newValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(offset: string.length)
    );
  }
}