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

  final _controller = TextEditingController();

  @override
  void initState() { 
    super.initState();
    _controller.addListener((){
      setState(() { });
    });        
  }

  @override
  Widget build(BuildContext context) {

    final _clear = IconButton(onPressed: (){ _controller.clear(); }, icon: Icon(Icons.close, color: kDarkGrey,));

    return
    Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Vencimiento', style: TextStyle(fontWeight: FontWeight.bold), ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              new CardNumberInputFormatter()
            ],  
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: kInputDecoration(
              hintText: '00 / 00',
              suffix: _clear
            )
          ),
        )
      ],
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