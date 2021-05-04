import 'package:flutter/material.dart';

import '../../constatnts.dart';

class PayButtons extends StatefulWidget {
  const PayButtons({
    Key key,
  }) : super(key: key);

  @override
  _PayButtonsState createState() => _PayButtonsState();
}

class _PayButtonsState extends State<PayButtons> {

  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final pantaiaa = MediaQuery.of(context).size.width;

    return ToggleButtons(
      children: [
        SizedBox(child: Image.asset('images/icons/master1.png'), height: 49,),
        SizedBox(child: Image.asset('images/icons/visa1.png'), height: 49,),
        SizedBox(child: Image.asset('images/icons/paypal1.png'), height: 49,),
      ],
      isSelected: isSelected,
      disabledColor: kGrey,
      selectedColor: kBlue,
      selectedBorderColor: kBlue,
      color: kYellow,
      borderRadius: BorderRadius.circular(kRadiusSmall),
      borderWidth: 2,
      constraints: BoxConstraints(minHeight: 50, minWidth: pantaiaa*0.275),
      onPressed: (index) {
        setState(() {
          for (var i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
    );
  }
}
