import 'package:flutter/material.dart';

Color textColor = const Color(0xFF222939);
Color veryLightTangeloColor = const Color(0xffffb56b);
Color mediumPurple = const Color.fromRGBO(139, 129, 215, 1.0);
Color sageViolet = const Color.fromRGBO(28, 35, 69, 0.35);

const height25 = SizedBox(
  height: dp_25,
);

TextStyle styleOnlyWhiteColor = const TextStyle(color: Colors.white);

TextStyle f14RBlackLetterSpacing2 = TextStyle(
    fontSize: fontSize14,
    fontFamily: 'Poppins',
    color: textColor,
    letterSpacing: dp_2);

TextStyle f16PW = const TextStyle(
  color: Colors.white,
  fontFamily: 'Poppins',
  fontSize: fontSize16,
);

TextStyle f16WhiteRoboto = const TextStyle(
  color: Colors.white,
  fontSize: fontSize16,
  fontFamily: "Roboto",
);

TextStyle f24RWhiteBold = const TextStyle(
  fontSize: fontSize24,
  fontFamily: 'Poppins',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle f42RWhiteBold = const TextStyle(
  fontSize: fontSize42,
  fontFamily: 'Poppins',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle f16RWhiteRoboto = const TextStyle(
  color: Colors.white54,
  fontSize: fontSize16,
  fontFamily: "Roboto",
);

TextStyle f52RWhiteRoboto = const TextStyle(
  color: Colors.white,
  fontSize: fontSize52,
  fontFamily: "Roboto",
);

LinearGradient weatherItemPurpleGradient = const LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[
    Color.fromRGBO(39, 40, 83, 1),
    Color.fromRGBO(47, 43, 92, 1),
    Color.fromRGBO(56, 49, 106, 1),
    Color.fromRGBO(58, 50, 111, 1),
    Color.fromRGBO(65, 53, 119, 1),
  ],
  tileMode: TileMode.mirror,
);

LinearGradient darkModeBlueGradient = const LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[
    Color.fromRGBO(22, 15, 69, 1),
    Color.fromRGBO(30, 20, 90, 1),
    Color.fromRGBO(36, 28, 103, 1),
    Color.fromRGBO(63, 53, 140, 1),
    Color.fromRGBO(83, 71, 171, 1),
    Color.fromRGBO(94, 82, 186, 1),
  ],
  tileMode: TileMode.mirror,
);

LinearGradient lightModePurpleGradient = const LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[
    Color.fromRGBO(27, 35, 68, 1),
    Color.fromRGBO(40, 41, 84, 1),
    Color.fromRGBO(78, 60, 135, 1),
    Color.fromRGBO(109, 76, 178, 1),
    Color.fromRGBO(134, 87, 212, 1),
  ],
  tileMode: TileMode.mirror,
);

const int durationWithMillis300 = 300;

const double fontSize14 = 14;
const double fontSize16 = 16;
const double fontSize20 = 20;
const double fontSize24 = 24;
const double fontSize42 = 42;
const double fontSize52 = 52;

const double dp_0 = 0;
const double dp_2 = 2;
const double dp_10 = 10;
const double dp_15 = 15;
const double dp_16 = 16;
const double dp_20 = 20;
const double dp_24 = 24;
const double dp_25 = 25;
const double dp_26 = 26;
const double dp_30 = 30;
const double dp_50 = 50;
const double dp_80 = 80;
const double dp_100 = 100;
const double dp_126 = 126;
const double dp_150 = 150;
const double dp_400 = 400;
