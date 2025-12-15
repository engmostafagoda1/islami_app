import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routename = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('إسلامي')),
        body: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
          decoration: BoxDecoration(
            color: Apptheme.white.withOpacity(0.8),
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
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Divider(color: Apptheme.lightprimary),
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
