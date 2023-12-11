import 'package:flutter/material.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

import '../../core/utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeBlue800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue800,
      );
  static get bodyLargeBlue800_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue800,
      );
  static get bodyLargeGray10002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray10002,
      );
  static get bodyLargeGray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargeGray700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargeOnSecondaryContainer =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeWhiteA700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          14,
        ),
      );
  static get bodyMediumBlue800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue800,
        fontSize: getFontSize(
          15,
        ),
      );
  static get bodyMediumBlue80014 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue800,
        fontSize: getFontSize(
          14,
        ),
      );
  static get bodyMediumBluegray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray900,
        fontSize: getFontSize(
          14,
        ),
      );
  static get bodyMediumBluegray900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: getFontSize(
          14,
        ),
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          15,
        ),
      );
  static get bodySmallBlue800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
      );
  static get bodySmallGray70010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
        fontSize: getFontSize(
          10,
        ),
      );
  static get bodySmallRedA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA700,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallYellowA400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.yellowA400,
      );
  // Label text style
  static get labelLargeBlue800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blue800,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelSmallBlue800 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blue800,
      );
  static get labelSmallPrimary => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Title text style
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimary_1 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeWhiteA700Regular => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlue800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get titleMediumBlue800_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get titleMediumGray100 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray100,
      );
  static get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleMediumRedA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA700,
      );
  static get titleMediumWhite => theme.textTheme.titleMedium!.copyWith(
        color: Colors.white,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: Colors.white,
    fontWeight: FontWeight.w700
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallBlue800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue800,
      );
  static get titleSmallBlue80014 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue800,
        fontSize: getFontSize(
          14,
        ),
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontSize: getFontSize(
          14,
        ),
      );
  static get titleSmallGray30001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray30001,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          14,
        ),
      );
  static get titleSmallYellowA400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.yellowA400,
      );
}

extension on TextStyle {
  TextStyle get sVNProductSans {
    return copyWith(
      fontFamily: 'SVN-Product Sans',
    );
  }
}
