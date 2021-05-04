import 'package:car_rental/constatnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UltimaPagina extends StatelessWidget {

  const UltimaPagina({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pantalla = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, '/'),
        child: Icon(Icons.home),
        elevation: 00,
        highlightElevation: 0,
        splashColor: kWhite.withOpacity(0.25),
      ),
      body:  
      SafeArea(        
        child: Center(        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: pantalla.height*0.25,
                width: double.infinity,
                child: Center(child: Text('¡ Gracias por su compra !', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
              ),
              Container(
                height: pantalla.height*0.3,
                width: double.infinity,
                //color: kBlue,
                child: Center(child: SizedBox( height: 250, width: 250, child: Image.asset('images/icons/logo.png',)))
              ),

              //Divider(indent: kPaddingBig, endIndent: kPaddingBig,),
              Container(                
                height: pantalla.height*0.3,
                width: double.infinity,                
                //color: kDarkGrey,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(                      
                      style: TextStyle(color: kBlack, fontSize: 16, height: 1, fontFamily: 'Exo',),
                      children: [
                      TextSpan( text: 'Desarrollado por Andrés Pugliese\n\n', style: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan( text: 'Github: github.com/andresdecba\n\n'),
                      TextSpan( text: 'LinkedIn: Andrés-Pugliese\n\n'),
                      TextSpan( text: 'eMail: Andrésdecba@gmail.com'),
                    ]),
                  )
                )
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}