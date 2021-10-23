import 'package:flutter/material.dart';
import 'package:islami_sat/home/HomeScreen.dart';
import 'package:islami_sat/home/quran/SuraDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyThemeData {
  static final Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static final Color colorBlack = Colors.black;
  static final Color colorWihte = Colors.white;
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: colorBlack, fontSize: 24),
        iconTheme: IconThemeData(color: MyThemeData.colorBlack),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyThemeData.primaryColor,
          selectedItemColor: MyThemeData.colorBlack,
          selectedLabelStyle: TextStyle(color: MyThemeData.colorBlack),
          selectedIconTheme: IconThemeData(color: MyThemeData.colorBlack)),
      primaryColor: MyThemeData.primaryColor,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: MyThemeData.primaryColor));
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: colorBlack)),
      primaryColor: MyThemeData.primaryColor);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
