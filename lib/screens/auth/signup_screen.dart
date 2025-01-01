import 'package:dack_mobile/controller/signup_controller.dart';
import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/widgets/custom_bottom.dart';
import 'package:dack_mobile/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

class SignupScreen extends StatelessWidget{
   SignupScreen({Key? key}) : super(key:key);

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child:  GetBuilder<SignupController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                 SizedBox(height: 50),
                   Align(
                    alignment: Alignment.center,
                     child: Text(
                      'ĐĂNG KÍ',
                      style: TextStyle(
                        
                        fontSize: 54,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                                   ),
                   ),

                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Name',
                    controller: controller.nameController,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Address',
                    obscureText: true,
                  controller: controller.addressController,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Contact',
                    controller: controller.contactController,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Email',
                 controller: controller.emailController,

                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Password',
                    obscureText: true,
                    controller: controller.passwordController,

                  ),
                  
                  
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Confirm Password',
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 20,
                  ),
                CustomBottom(label: "Sign Up",
                 onPressed: (){
                  controller.checkSignup();
                 },
                 ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20,
                  ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff949494),
                    ),
                    children:  [
                      TextSpan(
                        text: 'Already have a account? ',
                      ),
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()..onTap=(){
                          Get.toNamed(GetRoutes.login);
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
            }
          ),
        ),
      )
    );
  }
}