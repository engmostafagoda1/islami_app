import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Switch(
                value: settingProvider.isdark,
                onChanged: (x) {
                  settingProvider.changemode(
                    x ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.lang,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: settingProvider.Language,
                  style: Theme.of(context).textTheme.headlineSmall,
                  dropdownColor: settingProvider.isdark
                      ? Apptheme.gold
                      : Apptheme.white,
                  borderRadius: BorderRadius.circular(15),
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(AppLocalizations.of(context)!.eng),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(AppLocalizations.of(context)!.ara),
                    ),
                  ],
                  onChanged: (s) {
                    if (s == null) return;
                    settingProvider.changelang(s);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
