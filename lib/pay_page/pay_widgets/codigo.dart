import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';

class CodigoTarjeta extends StatefulWidget {

  const CodigoTarjeta({
    Key key,
  }) : super(key: key);

  @override
  _CodigoTarjetaState createState() => _CodigoTarjetaState();
}

class _CodigoTarjetaState extends State<CodigoTarjeta> {

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

    final clear = IconButton(onPressed: (){ _controller.clear(); }, icon: Icon(Icons.close, color: kDarkGrey,));

    return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( 'Código', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: kInputDecoration(
              hintText:  '000',
              suffix: clear
            ),
          ),

        ),
      ],
    );
  }
}