import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sat/home/quran/VerseItem.dart';
import 'package:islami_sat/main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) readFileContent(args.index);
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
          title: Text(args.name),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: MyThemeData.colorWihte,
                borderRadius: BorderRadius.circular(24)),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 96),
            child: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return VerseItem(verses[index], index);
                    },
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 48),
                        color: MyThemeData.primaryColor,
                        height: 1,
                      );
                    },
                    itemCount: verses.length,
                  )),
      )
    ]);
  }

  void readFileContent(int index) async {
    print('Loading,,,');
    String fileName = 'assets/files/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    //print(fileContent);
    List<String> ayat = fileContent.split('\n');
    verses = ayat;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.name, this.index);
}
