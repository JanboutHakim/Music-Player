import 'package:flutter/material.dart';

//Colors define
var darkmodebackground = const Color.fromRGBO(9, 18, 39, 1);
var normalmodebackground = const Color.fromRGBO(234, 240, 255, 1);

// prestinge of the screen function
double getPaddingprictinge(double p, context) {
  return MediaQuery.of(context).size.width * p / 100;
}

//Textstyle function
TextStyle setStyle(Color c, double size, bool isbold) {
  return TextStyle(
    fontSize: size,
    color: c,
    fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
    fontFamily: 'Gilory-Bold',
  );
}

// format time
format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
