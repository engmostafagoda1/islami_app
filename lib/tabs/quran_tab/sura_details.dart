import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/quran_tab/quran.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routename = 'suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];
  late SuraArg args;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraArg;
    if (ayat.isEmpty) {
      loadsura();
    }
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
                        'سورة ${args.suraname}',
                        style: TextStyle(
                          fontSize: 25,
                          color: settingProvider.isdark
                              ? Apptheme.gold
                              : Apptheme.blacktxt,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: settingProvider.isdark
                          ? Apptheme.gold
                          : Colors.black,
                      radius: 12,
                      child: Icon(
                        Icons.play_arrow,
                        color: settingProvider.isdark
                            ? Apptheme.blacktxt
                            : Apptheme.white,
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
                child: ayat.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: Apptheme.gold),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => Text(
                          '(${index + 1})${ayat[index]}',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: ayat.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadsura() async {
    String suradetail = await rootBundle.loadString(
      'assets/files/${args.index + 1}.txt',
    );
    ayat = suradetail.split('\n');
    setState(() {});
  }
}
