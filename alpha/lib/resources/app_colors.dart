import 'package:flutter/material.dart';

class AppColors {
  /// Gradient
  static const LinearGradient primaryGradient = LinearGradient(colors: [
    Color(0xCDFFFFFF),
    Color(0xFF58ABD1),
    Color(0xFF001790),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient tapedGradient = LinearGradient(colors: [
    AppColors.secondaryColor,
    Color(0xFF58ABD1),
    Color(0xFF001790),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient homeGradient = LinearGradient(colors: [
    Color(0xCDFFFFFF),
    Color(0xFF58ABD1),
    Color(0xFF001790),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  ///Colors
  static const Color primaryColor = Colors.green;
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color purpleColor = Color(0XFF053B8A);
  static const Color purple500 = Color(0X8B053B8A);
  static const Color purple200 = Color(0XFFBB86FC);
  static const Color lightBgColor = Color(0XFF053B8A);
  static const Color secondaryColor = Color(0xff32d18f);
  static const Color redColor = Color(0xFFFF0000);
  static const Color urduBtn = Color(0xffEF6926);
  static const Color lightGreen = Color(0xFF355D57);
  static const Color greyColor = Color.fromARGB(255, 211, 211, 211);

  static const Color lineColor = Color.fromARGB(255, 137, 137, 138);
}
