import 'package:flutter/material.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

import '../../core/utils/size_utils.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillBlue100 => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray10002 => BoxDecoration(
        color: appTheme.gray10002,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.64),
      );
  static BoxDecoration get fillYellowA => BoxDecoration(
        color: appTheme.yellowA400,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        gradient: LinearGradient(
          begin: Alignment(0.47, -0.11),
          end: Alignment(0.47, 1.05),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onError,
            theme.colorScheme.primary,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue800,
          width: getHorizontalSize(1),
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray300,
          width: getHorizontalSize(1),
        ),
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray300,
            width: getHorizontalSize(1),
          ),
          left: BorderSide(
            color: appTheme.gray300,
            width: getHorizontalSize(1),
          ),
        ),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.gray300,
        border: Border.all(
          color: appTheme.whiteA700,
          width: getHorizontalSize(2),
        ),
      );

  // T decorations
  static BoxDecoration get trang => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // X decorations
  static BoxDecoration get xam => BoxDecoration(
        color: appTheme.gray30001,
      );
  static BoxDecoration get xamtrang => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray30001,
          width: getHorizontalSize(1),
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        getHorizontalSize(50),
      );
  static BorderRadius get circleBorder7 => BorderRadius.circular(
        getHorizontalSize(7),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        getHorizontalSize(10),
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        getHorizontalSize(16),
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        getHorizontalSize(24),
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    