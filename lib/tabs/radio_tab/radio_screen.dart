import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/tabs/settings_tab/sitting_provider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool toogle = true;

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/raido.png'),
        SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.radioquran,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: settingProvider.isdark ? Apptheme.white : Apptheme.blacktxt,
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.backwardStep,
                color: settingProvider.isdark
                    ? Apptheme.gold
                    : Apptheme.lightprimary,
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                switching();
              },
              icon: toogle == true
                  ? Icon(
                      FontAwesomeIcons.play,
                      color: settingProvider.isdark
                          ? Apptheme.gold
                          : Apptheme.lightprimary,
                    )
                  : Icon(
                      FontAwesomeIcons.pause,
                      color: settingProvider.isdark
                          ? Apptheme.gold
                          : Apptheme.lightprimary,
                    ),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.forwardStep,
                color: settingProvider.isdark
                    ? Apptheme.gold
                    : Apptheme.lightprimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void switching() {
    toogle = !toogle;
    setState(() {});
  }
}
