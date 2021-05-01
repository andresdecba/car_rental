import 'package:car_rental/car_Details/car_details_page.dart';
import 'package:car_rental/confirmations_page/confirmations_page.dart';
import 'package:car_rental/models.dart';
import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:car_rental/car_Details/card_details_widgets/rental_info.dart';
import 'package:car_rental/ultima_pagina/ultima_page.dart';
import 'package:flutter/material.dart';

import 'car_selection_widgets/tarjetita.dart';

class CarSelectionPage extends StatelessWidget {

  const CarSelectionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, titulo: 'Modelos disponibles'),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              rentalInfo(),
              SizedBox(
                height: 10,
              ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => CarDetailsPage(recibirDatos: stockDeAutos[index]))); //CarDetailsPage(recibirDatos: stockDeAutos[index])))
                        },
                        onTapRentar: (){
                          return
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => ConfirmationPage( recibirDatos: stockDeAutos[index],) )); //CarDetailsPage(recibirDatos: stockDeAutos[index])
                        }
                      );

                  })
            ],
          ),
        ));
  }
}
