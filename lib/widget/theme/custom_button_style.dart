import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue800,
      );
  static ButtonStyle get fillBlue1 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue50,
      );
  static ButtonStyle get fillBlue2 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue100,
      );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray700.withOpacity(0.67),
      );
  static ButtonStyle get fillGray1 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray700,
      );
  static ButtonStyle get fillIndigo => ElevatedButton.styleFrom(
        backgroundColor: appTheme.indigo500,
      );
  static ButtonStyle get fillLightBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlue800,
      );
  static ButtonStyle get login => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueLogin,
      );
  static ButtonStyle get fillOnPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
      );
  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA700,
      );
  static ButtonStyle get fillYellowA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellowA400,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
