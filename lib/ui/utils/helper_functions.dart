import 'package:flutter/material.dart';

/*
a function that helps with risizing items dependin in the  device height
*/
double getHeightResponsiveItemSize(double value, Size size) =>
    size.height * (value / 812);
