import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFC10207);
  static const Color secondaryColor = Color(0xFF1E2429);
  static const Color tertiaryColor = Color(0xFFFFFFFF);

  static const Color customColor1 = Color(0xFF000000);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 32,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 22,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Rubik',
        color: secondaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
