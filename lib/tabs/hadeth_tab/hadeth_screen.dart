import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth_details.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty){
      loadhadeth();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.of(context).size.height * 0.22,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Apptheme.lightprimary, width: 2),
              bottom: BorderSide(color: Apptheme.lightprimary, width: 2),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'الأحاديث',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.of(
                context,
              ).pushNamed(HadethDetails.routename, arguments: ahadeth[index]),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      (ahadeth[index].title),
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            itemCount: ahadeth.length,
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
      ],
    );
  }

  Future<void> loadhadeth() async {
    String loadhadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> eachhadeth = loadhadeth.split('#');
    ahadeth = eachhadeth.map((x) {
      List<String> hadethnom = x.trim().split('\n');
      String title = hadethnom.first;
      hadethnom.removeAt(0);
      List<String> content = hadethnom;
      return Hadeth(content: content, title: title);
    }).toList();
    setState(() {});
  }
}
