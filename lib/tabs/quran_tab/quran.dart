import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/quran_tab/sura_details.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class Quran extends StatelessWidget {
  List<String> suraname = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.of(context).size.height * 0.22,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: settingProvider.isdark
                    ? Apptheme.gold
                    : Apptheme.lightprimary,
              ),
              bottom: BorderSide(
                color: settingProvider.isdark
                    ? Apptheme.gold
                    : Apptheme.lightprimary,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.ayanun,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: settingProvider.isdark
                      ? Apptheme.gold
                      : Apptheme.lightprimary,
                  thickness: 3,
                ),
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.suraname,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: VerticalDivider(
                  color: settingProvider.isdark
                      ? Apptheme.gold
                      : Apptheme.lightprimary,
                  thickness: 3,
                ),
              ),
              ListView.separated(
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    SuraDetails.routename,
                    arguments: SuraArg(suraname: suraname[index], index: index),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          (index + 1).toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          (suraname[index]).toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: suraname.length,
                separatorBuilder: (context, index) => Divider(
                  color: settingProvider.isdark
                      ? Apptheme.gold
                      : Apptheme.lightprimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SuraArg {
  String suraname;
  int index;

  SuraArg({required this.suraname, required this.index});
}
