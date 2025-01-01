import 'package:dack_mobile/pages/Homepage.dart';
import 'package:dack_mobile/screens/auth/login_screen.dart';
import 'package:dack_mobile/screens/auth/signup_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class GetRoutes{
  static const String login="/login";
  static const String sigup="/sigup";
  static const String home="/home";

  static List<GetPage> routes = [
    GetPage(name: GetRoutes.login, 
    page: () => LoginScreen()
    ),
    GetPage(name: GetRoutes.sigup, 
    page: () => SignupScreen()
    ),
    GetPage(name: GetRoutes.home, 
    page: () => HomePage()
    ),
  ];
}