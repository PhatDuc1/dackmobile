import 'package:dack_mobile/pages/Homepage.dart';
import 'package:dack_mobile/pages/ItemPage.dart';
import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
      ),
      routes: {
         
        "itemPage": (context) => ItemPage(),
      },
      initialRoute: GetRoutes.login,
      getPages: GetRoutes.routes,
    );
  }
}



