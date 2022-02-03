import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum AppTheme { dark, light }

/// constants used in global scope
class Constants {
  /// global app name
  static String appName = 'Foody Bite';

  //Colors for theme
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color lightPrimary = Color(0xFFFCFCFF);
  static const Color darkPrimary = Colors.black;
  static const Color lightAccent = Color(0xFF5563FF);
  static const Color darkAccent = Color(0xFF5563FF);
  static const Color lightBG = Color(0xFFfCfCFF);
  static const Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600]!;

  final appThemeData = {
    AppTheme.dark: darkTheme,
    AppTheme.light: lightTheme,
  };

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    fontFamily: 'spartan',
    colorScheme: const ColorScheme.light().copyWith(secondary: lightAccent),
    scaffoldBackgroundColor: lightBG,
    textSelectionTheme: const TextSelectionThemeData().copyWith(
      cursorColor: lightAccent,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        onPrimary: black,
        primary: Colors.transparent,
        textStyle: TextStyle(fontSize: 12.sp),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: lightBG,
      actionsIconTheme: const IconThemeData(color: black),
      iconTheme: const IconThemeData(color: black),
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w900,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    fontFamily: 'spartan',
    primaryColor: darkPrimary,
    textSelectionTheme: const TextSelectionThemeData().copyWith(
      cursorColor: darkAccent,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        onPrimary: white,
        primary: Colors.transparent,
        textStyle: TextStyle(fontSize: 12.sp),
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(secondary: darkAccent),
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: darkBG,
      actionsIconTheme: const IconThemeData(color: white),
      iconTheme: const IconThemeData(color: white),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
