import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routename = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingProvider.bgimage),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.islami)),
        body: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
          decoration: BoxDecoration(
            color: settingProvider.isdark
                ? Apptheme.darkprimary.withOpacity(0.8)
                : Apptheme.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        args.title,
                        style: TextStyle(
                          fontSize: 25,
                          color: settingProvider.isdark
                              ? Apptheme.gold
                              : Apptheme.blacktxt,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Divider(
                  color: settingProvider.isdark
                      ? Apptheme.gold
                      : Apptheme.lightprimary,
                ),
              ),
              Expanded(
                child: args.content.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: Apptheme.gold),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => Text(
                          args.content[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: args.content.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
