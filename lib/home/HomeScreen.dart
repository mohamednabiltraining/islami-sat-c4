import 'package:flutter/material.dart';
import 'package:islami_sat/home/hadeth/HadethTab.dart';
import 'package:islami_sat/home/quran/QuranTab.dart';
import 'package:islami_sat/home/radio/RadioTab.dart';
import 'package:islami_sat/home/sebha/SebhaTab.dart';
import 'package:islami_sat/main.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Islami'),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyThemeData.primaryColor),
            child: BottomNavigationBar(
              onTap: (index) {
                currentPage = index;
                setState(() {});
              },
              currentIndex: currentPage,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_moshaf.png'),
                      size: 48,
                    ),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_hadeth.png'),
                      size: 48,
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_sebha.png'),
                      size: 48,
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_radio.png'),
                      size: 48,
                    ),
                    label: 'Radio'),
              ],
            ),
          ),
          body: Container(child: getMainView()),
        ),
      ],
    );
  }

  Widget getMainView() {
    if (currentPage == 0) {
      return QuranTab();
    } else if (currentPage == 1) {
      return HadethTab();
    } else if (currentPage == 2) {
      return SebhaTab();
    } else {
      return RadioTab();
    }
  }
}
