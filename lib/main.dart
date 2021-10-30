import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_sat/home/HomeScreen.dart';
import 'package:islami_sat/home/hadeth/HadethDetailsScreen.dart';
import 'package:islami_sat/home/quran/SuraDetailsScreen.dart';
import 'package:islami_sat/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppConfigProvider>(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class MyThemeData {
  static final Color lightPrimaryColor = Color.fromARGB(255, 183, 147, 95);
  static final Color darkPrimaryColor = Color.fromARGB(255, 20, 26, 46);
  static final Color yellowColor = Color.fromARGB(255, 250, 204, 29);
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
          backgroundColor: MyThemeData.lightPrimaryColor,
          selectedItemColor: MyThemeData.colorBlack,
          selectedLabelStyle: TextStyle(color: MyThemeData.colorBlack),
          selectedIconTheme: IconThemeData(color: MyThemeData.colorBlack)),
      primaryColor: MyThemeData.lightPrimaryColor,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: MyThemeData.lightPrimaryColor));
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: colorWihte, fontSize: 24),
        iconTheme: IconThemeData(color: MyThemeData.colorWihte),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyThemeData.darkPrimaryColor,
          selectedItemColor: MyThemeData.colorBlack,
          selectedLabelStyle: TextStyle(color: MyThemeData.yellowColor),
          selectedIconTheme: IconThemeData(color: MyThemeData.yellowColor)),
      primaryColor: MyThemeData.darkPrimaryColor,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: MyThemeData.yellowColor));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (buildContext) => HadethDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
