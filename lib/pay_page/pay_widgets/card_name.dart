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

    final clear = IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        _controller.clear();  
      },
    );

    return
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nombre completo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          
          TextField(
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,

            decoration: InputDecoration(
                hintText: 'Juan Pérez',
                hintStyle: TextStyle(color: kLightGrey),                
                suffixIcon: clear,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadiusSmall), borderSide: BorderSide(color: kYellow))),
          ),
        ],
      ),
    );
  }
}