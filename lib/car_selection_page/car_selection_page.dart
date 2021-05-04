import 'package:car_rental/car_Details/car_details_page.dart';
import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'car_selection_widgets/tarjetita.dart';

class CarSelectionPage extends StatelessWidget {

  const CarSelectionPage();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: appBar(context, titulo: 'Modelos disponibles'),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: kPaddingSmall),
          children: [
            
            rentalInfo(),

            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemCount: stockDeAutos.length,
              itemBuilder: (context, index) {
                return tarjetita(
                  autosModel: stockDeAutos[index],
                  context: context,
                  onTapVerMas: () {
                    return
                    Navigator.push(context, CupertinoPageRoute(builder: (builder) => CarDetailsPage(recibirDatos: stockDeAutos[index]))); //CarDetailsPage(recibirDatos: stockDeAutos[index])))
                  },
                  onTapRentar: (){
                    return
                    Navigator.push(context, CupertinoPageRoute(builder: (builder) => ConfirmationPage( recibirDatos: stockDeAutos[index],) )); //CarDetailsPage(recibirDatos: stockDeAutos[index])
                  }
                );
              }
            )
          ],
        ),
      )
    );
  }
}
