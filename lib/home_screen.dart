import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth_screen.dart';
import 'package:islami_app/tabs/quran_tab/quran.dart';
import 'package:islami_app/tabs/radio_tab/radio_screen.dart';
import 'package:islami_app/tabs/sebha_tab/sebha_screen.dart';
import 'package:islami_app/tabs/settings_tab/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttab = 0;

  List<Widget> tabs = [
    Quran(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('إسلامي')),
        body: tabs[currenttab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currenttab,
          onTap: (index) {
            currenttab = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
