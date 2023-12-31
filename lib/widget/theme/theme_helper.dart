import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/utils/size_utils.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0XFFFFFFFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.gray300,
              width: 1,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.whiteA700.withOpacity(0.2),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.yellowA400,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: appTheme.yellowA400,
          fontSize: getFontSize(
            8,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.redA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SVN-Product Sans',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF00057D),
    primaryContainer: Color(0XFF003EDE),
    secondary: Color(0XFF003EDE),
    secondaryContainer: Color(0XFFF2C94C),
    tertiary: Color(0XFF003EDE),
    tertiaryContainer: Color(0XFFF2C94C),

    // Background colors
    background: Color(0XFF003EDE),

    // Surface colors
    surface: Color(0XFF003EDE),
    surfaceTint: Color(0XFFEA4335),
    surfaceVariant: Color(0XFFF2C94C),

    // Error colors
    error: Color(0XFFEA4335),
    errorContainer: Color(0XFF001BAE),
    onError: Color(0X0000057D),
    onErrorContainer: Color(0XFFF2C94C),

    // On colors(text colors)
    onBackground: Color(0XFF000054),
    onInverseSurface: Color(0X0000057D),
    onPrimary: Color(0XFFEA4335),
    onPrimaryContainer: Color(0XFF000054),
    onSecondary: Color(0XFF000054),
    onSecondaryContainer: Color(0XFF001BAE),
    onTertiary: Color(0XFF000054),
    onTertiaryContainer: Color(0XFF001BAE),

    // Other colors
    outline: Color(0XFFEA4335),
    outlineVariant: Color(0XFF003EDE),
    scrim: Color(0XFF003EDE),
    shadow: Color(0XFFEA4335),

    // Inverse colors
    inversePrimary: Color(0XFF003EDE),
    inverseSurface: Color(0XFFEA4335),

    // Pending colors
    onSurface: Color(0XFF000054),
    onSurfaceVariant: Color(0XFF001BAE),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue100 => Color(0XFFC9DBFF);
  Color get blue50 => Color(0XFFECF0FF);
  Color get blue800 => Color(0XFF0030DE);
  Color get blueX => fromHex('#00057D');
  Color get blueXD => fromHex('#0031DE');
  Color get F2C94C => fromHex('#F2C94C');
  Color get blueLogin => fromHex('#00057D');
  Color get xam2 => fromHex('#F2F2F2');
  Color get whiteBackGroup => Colors.white10.withOpacity(0.4);
  // Color get whiteBackGroup => fromHex('#F9FAFF');

  // BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF313131);

  // BlueGrayf
  Color get blueGray4007f => Color(0X7F718096);

  // Gray
  Color get gray100 => Color(0XFFF7F7F7);
  Color get gray10001 => Color(0XFFF4F2F2);
  Color get gray10002 => Color(0XFFF2F2F2);
  Color get gray300 => Color(0XFFE6E6E6);
  Color get gray30001 => Color(0XFFDEDEDE);
  Color get gray50 => Color(0XFFF9FAFF);
  Color get gray700 => Color(0XFF6B6A6A);

  // Indigo
  Color get indigo500 => Color(0XFF4568B1);

  // LightBlue
  Color get lightBlue800 => Color(0XFF0077B5);

  // Red
  Color get redA700 => Color(0XFFEC0015);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellowA400 => Color(0XFFFFE200);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
