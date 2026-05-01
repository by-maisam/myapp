import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static const TextTheme LightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.LightTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.LightTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.LightTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      color: AppColors.LightTextColor,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: AppColors.LightTextColor,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.LightTextColor,
    ),
  );
  static const TextTheme DarkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.DarkTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.DarkTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.DarkTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      color: AppColors.DarkTextColor,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: AppColors.DarkTextColor,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.DarkTextColor,
    ),
  );

  static final ThemeData LightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.brandcolor,
    scaffoldBackgroundColor: AppColors.LightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.LightAppBackground,
      foregroundColor: AppColors.LightTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandcolor,
        foregroundColor: AppColors.buttonTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.LightTextColor,
        padding: EdgeInsets.all(0),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.LightDrawerBackground,
    ),
    cardTheme: CardThemeData(color: AppColors.LightCardColor),
    textTheme: LightTextTheme,
  );

  static final ThemeData DarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.brandcolor,
    scaffoldBackgroundColor: AppColors.DarkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.DarkAppBackground,
      foregroundColor: AppColors.DarkTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandcolor,
        foregroundColor: AppColors.buttonTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.DarkTextColor,
        padding: EdgeInsets.all(0),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.DarkDrawerBackground,
    ),
    cardTheme: CardThemeData(color: AppColors.DarkCardColor),
    textTheme: DarkTextTheme,
  );
}
