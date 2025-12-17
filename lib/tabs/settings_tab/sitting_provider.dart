import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  String Language = 'en';

  SettingProvider(){
    loadshared();
  }

  bool get isdark => theme == ThemeMode.dark;

  String get bgimage =>
      isdark ? 'assets/images/bg black.png' : 'assets/images/bg3.png';

  Future<void> changemode(ThemeMode x) async{
    theme = x;
    final prefs=await SharedPreferences.getInstance();
    prefs.setString('theme', theme == ThemeMode.dark?'dark':'light');
    notifyListeners();
  }
  Future<void> changelang(String x) async{
    Language=x;
    final prefs =await SharedPreferences.getInstance();
    prefs.setString('language', Language);
    notifyListeners();
  }

  Future<void> loadshared()async{
    final prefs=await SharedPreferences.getInstance();

    String? savedtheme=prefs.getString('theme');
    String? Savedlang=prefs.getString('language');

    if(savedtheme != null){
      theme= savedtheme == 'dark' ? ThemeMode.dark:ThemeMode.light;
    }

    if(Savedlang != null){
      Language = Savedlang;
    }
    notifyListeners();
  }
}
