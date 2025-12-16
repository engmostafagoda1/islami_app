import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami_app/apptheme.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool toogle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/raido.png'),
        SizedBox(height: 20),
        Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.backwardStep,
                color: Apptheme.lightprimary,
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                switching();
              },
              icon: toogle == true
                  ? Icon(FontAwesomeIcons.play, color: Apptheme.lightprimary)
                  : Icon(FontAwesomeIcons.pause, color: Apptheme.lightprimary),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.forwardStep,
                color: Apptheme.lightprimary,
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
