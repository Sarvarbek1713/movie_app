import 'package:flutter/material.dart';

mixin ScreenSizeUtil {
   double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

   double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

   bool isSmallScreen(BuildContext context) {
    return getWidth(context) < 600; 
  }

   bool isMediumScreen(BuildContext context) {
    double width = getWidth(context);
    return width >= 600 && width < 1024; 
  }

   bool isLargeScreen(BuildContext context) {
    return getWidth(context) >= 1024; 
  }
}
