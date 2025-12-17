import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth_details.dart';
import 'package:islami_app/tabs/quran_tab/sura_details.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => SettingProvider(), child: islami()),
  );
}

class islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (_) => HomeScreen(),
        SuraDetails.routename: (_) => SuraDetails(),
        HadethDetails.routename: (_) => HadethDetails(),
      },
      theme: Apptheme.light,
      darkTheme: Apptheme.dark,
      themeMode: settingProvider.theme,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.Language),
    );
  }
}
