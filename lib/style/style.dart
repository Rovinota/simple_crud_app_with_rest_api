import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const ColourRed = Color.fromRGBO(231, 28, 36, 1);
const ColourGreen = Color.fromRGBO(33, 191, 115, 1);
const ColourWhite = Color.fromRGBO(255, 255, 255, 1);
const ColourDarkBlue = Color.fromRGBO(44, 62, 80, 1);

ScreenBackground (context) {
  return SvgPicture.asset(
    'Assets/images/background.svg',
    alignment: Alignment.center,
    // width: MediaQuery.of(context).size.width,
    // height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

InputDecoration AppinputDeceration(Lebel) {
  return  InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColourGreen, width: 1
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black, width: 1
      ),
    ),
    fillColor: ColourWhite,
    filled: true,
    border: OutlineInputBorder(),
    labelText: Lebel,
  );
}
DecoratedBox AppDropdownstyle (child) {
  return DecoratedBox(decoration: BoxDecoration(
    color: ColourWhite,
    border: Border.all(color: ColourDarkBlue, width: 1),
    borderRadius: BorderRadius.circular(4),

  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}
ButtonStyle Appbuttonstyle () {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), )
  );
}