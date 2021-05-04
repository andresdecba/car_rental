import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';

class NombreCompleto extends StatefulWidget {

  const NombreCompleto({
    Key key,
  }) : super(key: key);

  @override
  _NombreCompletoState createState() => _NombreCompletoState();
}

class _NombreCompletoState extends State<NombreCompleto> {

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
        Text( 'Nombre completo', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: kInputDecoration(
              hintText:  'Nombre Completo',
              suffix: clear
            ),
          ),

        ),
      ],
    );
  }
}