import 'package:flutter/material.dart';
import 'package:tracking/core/utils/palette.dart';

import '../utils/app_text_styles.dart';

class AppTheme {

  AppTheme._();

  //ThemeData for Dark Theme
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Palette.bgSearchView,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.white,
          primaryContainer: Colors.white30,
          secondary: Colors.grey),
      cardTheme: const CardTheme(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white54),
      progressIndicatorTheme: const ProgressIndicatorThemeData(circularTrackColor: Colors.white),
      cardColor: Colors.white,
      canvasColor: Colors.black,
      dividerColor: Colors.white,
      textTheme: TextTheme(
        titleMedium: AppTextStyle.textStyle14Normal(textColor: Colors.white),
        titleSmall: AppTextStyle.textStyle12Normal(textColor: Colors.white),
        titleLarge: AppTextStyle.textStyle18Normal(textColor: Colors.white),
        bodyMedium: AppTextStyle.textStyle14Normal(textColor: Colors.black),
          labelMedium: AppTextStyle.textStyle14Normal(textColor: Colors.black)
      ));
}
