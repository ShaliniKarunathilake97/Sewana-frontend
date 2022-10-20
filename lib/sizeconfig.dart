// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class SizeConfig {
 
 static double screenWidth =0;
 static double screenHeight =0;
 static double blockSizeHorizontal =0;
 static double blockSizeVertical =0;

  static double safeAreaHorizontal =0;
 static double safeAreaVertical = 0;
 static double safeBlockHorizontal =0;
 static double safeBlockVertical =0;
 
 void init(BuildContext context) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
  blockSizeHorizontal = screenWidth / 100;
  blockSizeVertical = screenHeight / 100;

 safeAreaHorizontal = _mediaQueryData.padding.left + 
 _mediaQueryData.padding.right;
 safeAreaVertical = _mediaQueryData.padding.top +
 _mediaQueryData.padding.bottom;
 safeBlockHorizontal = (screenWidth -
 safeAreaHorizontal) / 100;
 safeBlockVertical = (screenHeight -
 safeAreaVertical) / 100;
 }
}