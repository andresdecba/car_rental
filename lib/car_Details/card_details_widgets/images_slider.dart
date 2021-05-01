import 'package:car_rental/car_Details/card_details_widgets/ampliar_imagen.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {

  const ImagesSlider({  Key key, this.recibirDatos}) : super(key: key);
  
  final AutosModel recibirDatos;

  @override
  Widget build(BuildContext context) {
          
    List fotos = [ ];

    for (var item in recibirDatos.image) {
      fotos.add(Image.asset(item));
    }

    return
    AspectRatio(
      aspectRatio: 2,
      child: Carousel(

        dotBgColor: kWhite.withOpacity(0),
        dotColor: kBlack.withOpacity(0.5),
        dotIncreasedColor: kBlack.withOpacity(0.5),
        boxFit: BoxFit.fitHeight,
        animationCurve: Curves.easeIn,
        onImageTap: (i){
          Navigator.push(context, MaterialPageRoute(builder: (builder) => AmpliarImagen(recibirDatos: recibirDatos, ) ));
        },
        images: fotos,
        showIndicator: false,

      ),
    );
  }
}