import 'package:flutter/material.dart';

// const Color mainColor = Color(0xFF2D7C99);
// const Color mainColor = Color(0xFF2E69C0);
Color mainColor = Colors.blue[700]/* colorFromHex("#7F3DFF") */;
const Color mainTextColor = Color(0xFF050A30);
const Color mainColorGradient = Color(0xFF9067fc);

/* Color blueGreyColor = Colors.blueGrey; */
Color greyOpacity(value) => Colors.grey.withOpacity(value);

Color greyColor(value) => Colors.grey[value];

Color redColor(value) => Colors.red[value];

Color greenColor(value) => Colors.green[value];

Color orangeColor(value) => Colors.orange[value];

Color blueColor(value) => Colors.blue[value];

Color blueGreyColor(value) => Colors.blueGrey[value];

Color blackColor = Colors.black;
Color tealColor = Colors.teal;
Color whiteColor = Colors.white;
Color headerVariableColor = Colors.black;
Color textColor = Color(0xFFA1B1C2);
Color subTextColor = Color(0xFF707070);
Color greyBackground = Color.fromARGB(255, 252, 252, 252);
Color mainCustomerHomeGreyBackround = Colors.grey[200];

Color whiteOpacity(value) => Colors.white.withOpacity(value); //0.8

Color blackOpacity = Colors.black.withOpacity(0.8);

Color textFieldFillColor = Colors.grey[50];
const Color textFieldIconColor = Color(0xFF5D6A78);
const Color categoryIconColor = Color(0xFFB3C0C8);

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

// Colors
const Color kBlue = Color(0xFF306EFF);
const Color kLightBlue = Color(0xFF4985FD);
const Color kDarkBlue = Color(0xFF1046B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGrey = Color(0xFFF4F5F7);
const Color kBlack = Color(0xFF2D3243);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

// Assets
const String kGoogleLogoPath = 'assets/images/google_logo.png';
