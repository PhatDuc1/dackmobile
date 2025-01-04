import 'package:dack_mobile/controller/login_controller.dart';
import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/widgets/custom_bottom.dart';
import 'package:dack_mobile/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final signupController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: GetBuilder<LoginController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'ĐĂNG NHẬP',
                  style: TextStyle(
                    fontSize: 54,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                hint: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'Password',
                obscureText: true,
                controller: controller.passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomBottom(
                label: "Login",
                onPressed: () {
                  controller.checkLogin();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Color(0xff949494),
                  ),
                  children: [
                    TextSpan(
                      text: 'Don\'t have a account? ',
                    ),
                    TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(GetRoutes.sigup);
                        },
                      style: TextStyle(
                        color: Color(0xff6b7afc),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ],
          );
        }),
      ),
    ));
  }
}
