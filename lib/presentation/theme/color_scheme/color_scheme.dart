import 'package:flutter/material.dart';

import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

final ColorScheme darkColorScheme = ColorScheme.dark(
    primary: tempColor.purpleColor,
    secondary: tempColor.blueColor,
    // ignore: deprecated_member_use
    primaryVariant: tempColor.lightPurpleColor,
    // ignore: deprecated_member_use
    secondaryVariant: tempColor.lightBlueColor,
    surface: tempColor.blackColor,
    background: tempColor.greyColor,
    error: tempColor.redColor,
    onPrimary: tempColor.whiteColor,
    onSecondary: tempColor.whiteColor,
    onSurface: tempColor.offWhiteColor,
    onError: tempColor.whiteColor,
    onBackground: tempColor.offWhiteColor,
    brightness: Brightness.dark);

final ColorScheme lightColorScheme = ColorScheme.light(
    primary: tempColor.blueColor,
    secondary: tempColor.purpleColor,
    // ignore: deprecated_member_use
    primaryVariant: tempColor.lightBlueColor,
    // ignore: deprecated_member_use
    secondaryVariant: tempColor.lightPurpleColor,
    surface: tempColor.backgroundColor,
    background: tempColor.backgroundColor,
    error: tempColor.redColor,
    onPrimary: tempColor.whiteColor,
    onSecondary: tempColor.whiteColor,
    onSurface: tempColor.greyColor,
    onError: tempColor.whiteColor,
    onBackground: tempColor.greyColor,
    brightness: Brightness.light);
