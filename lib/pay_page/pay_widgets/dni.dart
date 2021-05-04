import 'package:car_rental/constatnts.dart';
import 'package:flutter/material.dart';

class DNI extends StatefulWidget {

  const DNI({
    Key key,
  }) : super(key: key);

  @override
  _DNIState createState() => _DNIState();
}

class _DNIState extends State<DNI> {

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

        Text( 'DNI', style: TextStyle(fontWeight: FontWeight.bold),),
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingSmallSmall),
          
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.number,
            
            decoration: kInputDecoration(
              hintText: '00.000.000',
              suffix: _clear
            )
          ),
        ),
      ],
    );
  }
}