import 'package:flutter/material.dart';
import 'package:islami_app/apptheme.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    color: Apptheme.lightprimary.withOpacity(0.57),
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
                    'سبحان الله',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Apptheme.lightprimary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Apptheme.lightprimary.withOpacity(0.6),
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
