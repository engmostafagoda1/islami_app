import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/images/head of seb7a.png'),
          Transform.translate(
            offset: Offset(0, -80),
            child: Image.asset('assets/images/body of seb7a.png'),
          ),
          Transform.translate(
            offset: Offset(0, -85),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.sebhanum,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 15),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    color: settingProvider.isdark
                        ? Apptheme.darkprimary
                        : Apptheme.lightprimary.withOpacity(0.57),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      (counter).toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    increment();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.sobhanallah,
                    style: TextStyle(
                      fontSize: 25,
                      color: settingProvider.isdark
                          ? Apptheme.blacktxt
                          : Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      settingProvider.isdark
                          ? Apptheme.gold
                          : Apptheme.lightprimary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: settingProvider.isdark
                      ? Apptheme.gold.withOpacity(0.9)
                      : Apptheme.lightprimary.withOpacity(0.8),
                  child: IconButton(
                    onPressed: () {
                      clear();
                    },
                    icon: Icon(
                      Icons.replay,
                      fontWeight: FontWeight.bold,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void increment() {
    counter++;
    setState(() {});
  }

  void clear() {
    counter = 0;
    setState(() {});
  }
}
