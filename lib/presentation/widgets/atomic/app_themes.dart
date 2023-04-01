import 'package:dukalink/domain/value_objects/app_constants.dart';
import 'package:flutter/material.dart';

/// This class holds common themes
class DukalinkThemes {
  /// Returns a TextStyle
  TextStyle textThemes(
      {required Color color, double? fontSize, FontWeight? fontWeight}) {
    TextStyle textTheme = TextStyle(
        color: color,
        fontSize: fontSize ?? defaultFontSize,
        fontWeight: fontWeight ?? FontWeight.normal);

    return textTheme;
  }

  /// [DukalinkThemes] Colors
  static const Color primaryColor = Color(0xff10277C);
  static const Color secondaryColor = Color(0xFFF57C00);
  static const Color accentColor = Color(0xFFFFAB40);

  static const Color whiteSmoke = Colors.white70;
  static const Color grey = Color(0xff828282);
  static const Color orange = Colors.deepOrange;
  static const Color lightOrange = Colors.orange;
}
