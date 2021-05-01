import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AmpliarImagen extends StatefulWidget {
  const AmpliarImagen({Key key, this.recibirDatos}) : super(key: key);

  final AutosModel recibirDatos;

  @override
  _AmpliarImagenState createState() => _AmpliarImagenState();
}

class _AmpliarImagenState extends State<AmpliarImagen> {


  final mediaQuery = MediaQueryData().orientation;


  @override
  Widget build(BuildContext context) {

    var isPortrait = MediaQuery.of(context).orientation;
    final orientation = Orientation.portrait;

    List fotos = [ ];
    for (var item in widget.recibirDatos.image) {
      fotos.add(Image.asset(item));
    }
    
    setState(() { 
      isPortrait == orientation ? 
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        //DeviceOrientation.portraitDown,
      ]) :
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        //DeviceOrientation.landscapeLeft,
      ]);
    });
    

    return
    Scaffold(
      appBar: appBar(context, bgColor: kWhite.withOpacity(0), titulo: ''),
      
      body:
      SafeArea(
        child: Center(
          child: SizedBox(
            
            height: double.infinity,
            width: double.infinity,
            child: //Image.asset(foto)
            Carousel(
              images: fotos,
            )
          ),
        ),
      ),
    );
  }
}

/*
       SafeArea(
         child: Center(
           child: SizedBox(
            
            height: double.infinity,
            width: double.infinity,
            child: //Image.asset(foto)

            //ElevatedButton(onPressed: (){print(isPortrait);}, child: Text('data')),

            //Carousel( images: fotos, )
            //
            OrientationBuilder(
              builder: (context, orientation) {
                return
                
                orientation == Orientation.portrait ?  
                RotatedBox(quarterTurns: 0, child: Image.asset('images/auto-1.png')) :
                RotatedBox(quarterTurns: 1, child: Image.asset('images/auto-1.png'));

              },
            )
            
          ),
         ),
       ),


*/