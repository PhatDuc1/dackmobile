import 'package:dack_mobile/pages/HomePage.dart';
import 'package:dack_mobile/pages/ItemPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => HomePage(),
        "ItemPage": (context) => ItemPage(),
      },
    );
  }
}



