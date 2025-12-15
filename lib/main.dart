import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/tabs/quran_tab/sura_details.dart';

void main(){
  runApp(islami());
}

class islami extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (_) => HomeScreen(),
        SuraDetails.routename: (_) => SuraDetails(),
      },
      theme: Apptheme.light,
      darkTheme: Apptheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}