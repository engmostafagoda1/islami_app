import 'package:flutter/material.dart';

class Apptheme {
  static const Color lightprimary = Color(0xffB7935F);
  static const Color darkprimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color gold = Color(0xffFACC1D);
  static const Color blacktxt = Color(0xff242424);

  static ThemeData light =ThemeData(
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightprimary,
      selectedItemColor: blacktxt,
      unselectedItemColor: white,
    ),
    
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: blacktxt),
      titleLarge: TextStyle(fontSize: 20, color: blacktxt)
    )
  );

  static ThemeData dark =ThemeData();
}
