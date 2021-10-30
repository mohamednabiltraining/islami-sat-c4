import 'package:flutter/material.dart';
import 'package:islami_sat/home/hadeth/HadethTab.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: SingleChildScrollView(
            child: Text(
              args.content,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ]);
  }
}
