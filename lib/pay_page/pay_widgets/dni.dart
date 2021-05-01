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
            'DNI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          
          TextField(
            controller: _controller,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.number,

            decoration: InputDecoration(
                hintText: '1234567890',
                hintStyle: TextStyle(color: kLightGrey),                
                suffixIcon: clear,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadiusSmall), borderSide: BorderSide(color: kYellow))),
          ),
        ],
      ),
    );
  }
}