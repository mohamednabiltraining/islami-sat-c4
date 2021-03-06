import 'package:flutter/material.dart';
import 'package:islami_sat/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
