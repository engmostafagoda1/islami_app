import 'package:flutter/material.dart';

class Apptheme {
  static const Color lightprimary = Color(0xffB7935F);
  static const Color darkprimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color gold = Color(0xffFACC1D);
  static const Color blacktxt = Color(0xff242424);

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(
      foregroundColor: blacktxt,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blacktxt,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightprimary,
      selectedItemColor: blacktxt,
      unselectedItemColor: white,
    ),

    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 25,
        color: blacktxt,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(fontSize: 25, color: blacktxt),
      titleLarge: TextStyle(fontSize: 20, color: blacktxt),
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(
      foregroundColor: white,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkprimary,
      selectedItemColor: gold,
      unselectedItemColor: white,
    ),

    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 25,
        color: white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(fontSize: 25, color: white),
      titleLarge: TextStyle(fontSize: 20, color: gold),
    ),
  );
}
