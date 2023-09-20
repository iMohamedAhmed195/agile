import 'package:flutter/material.dart';

class ScreenSize{
  static late double screenWidth;
  static late double screenHeight;
  static void init(BuildContext context){
    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
  }
  static double? getSize(double n) {
    return screenWidth*n;
  }
}