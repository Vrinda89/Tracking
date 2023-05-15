import 'package:flutter/material.dart';
import 'font_type.dart';
import 'palette.dart';

class AppTextStyle {
  static const String _fontRegular = "WorkSans-Regular";
  static const String _fontBold = "WorkSans-Bold";
  static const String _fontItalic = "DroidSerif-Italic";
  static const textTitle = 20.0;
  static const textRegularTitle = 15.0;



  static String _getFont(FontType fontType) {
    if (fontType == FontType.regular) {
      return _fontRegular;
    } else if (fontType == FontType.bold) {
      return _fontBold;
    } else if (fontType == FontType.italic) {
      return _fontItalic;
    }
    return _fontRegular;
  }

  static TextStyle getAppTextStyle(
      Color color, FontType fontType, double fontSize) {
    return TextStyle(
        color: color,
        height: 1.2,
        fontSize: fontSize,
        fontFamily: _getFont(fontType));
  }

  static TextStyle textStyle14Normal(
      {Color textColor = Palette.textFieldSecondary}) {
    return TextStyle(
        fontFamily: "WorkSans",
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: textColor);
  }
  static TextStyle textStyle18Normal(
      {Color textColor = Palette.textFieldSecondary}) {
    return TextStyle(
        fontFamily: "WorkSans",
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: textColor);
  }
  static TextStyle textStyle12Normal(
      {Color textColor = Palette.textFieldSecondary}) {
    return TextStyle(
        fontFamily: "WorkSans",
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: textColor);
  }



  static TextStyle textStyle22Bold( {Color textColor = Palette.textFieldSecondary}) {
    return  TextStyle(
        fontFamily: "WorkSans",
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: textColor);
  }
}
