import 'package:flutter/material.dart';

extension AppColor on Color {
  Color get whiteColor => const Color.fromRGBO(255, 255, 255, 1);
  Color get offWhiteColor => const Color.fromRGBO(245, 245, 245, 1);
  Color get blackColor => const Color.fromRGBO(35, 31, 32, 1);
  Color get greyColor => const Color.fromRGBO(103, 106, 119, 1);
  Color get lightGreyColor => const Color.fromRGBO(220, 220, 220, 1);
  Color get redColor => const Color.fromRGBO(236, 28, 36, 1);
  Color get blueColor => const Color.fromRGBO(13, 153, 255, 1);
  Color get lightBlueColor => const Color.fromRGBO(209, 233, 250, 1);
  Color get robinEggBlueColor => const Color.fromRGBO(72, 149, 255, 1);
  Color get purpleColor => const Color.fromRGBO(107, 122, 254, 1);
  Color get lightPurpleColor => const Color.fromRGBO(107, 141, 254, 1);
  Color get backgroundColor => const Color.fromRGBO(244, 247, 254, 1);
  Color get disableDarkColor => const Color.fromRGBO(107, 141, 254, 0.8);
  Color get disablelightColor => const Color.fromRGBO(72, 149, 255, 0.8);
  Color get appbarBlueColor => const Color.fromRGBO(27, 117, 187, 1);
  Color get circularblue => const Color.fromRGBO(215, 234, 249, 1);
  Color get cardpink => const Color.fromRGBO(242, 121, 131, 1);
  Color get cardblue => const Color.fromRGBO(31, 130, 191, 1);
  Color get cardlightblue => const Color.fromRGBO(118, 190, 241, 1);
  Color get cardred => const Color.fromRGBO(222, 43, 51, 1);
  Color get cardskyblue => const Color.fromRGBO(222, 237, 250, 1);
  Color get lightGreyColor1 => const Color.fromRGBO(249, 249, 250, 1);
  Color get greenColor => const Color.fromRGBO(2, 146, 97, 1);
  Color get timeblue => const Color.fromRGBO(27, 117, 187, 1);
  Color get statuspink => const Color.fromRGBO(255, 199, 201, 1);
  Color get statusyellow => const Color.fromRGBO(255, 232, 159, 1);
  Color get statusgreen => const Color.fromRGBO(177, 255, 182, 1);
  Color get statusdark => Color.fromARGB(255, 18, 123, 145);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
