import 'dart:convert';

import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/utils/baseurl.dart';
import 'package:dack_mobile/utils/custom_snackbar.dart';
import 'package:dack_mobile/widgets/Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
class SignupController extends GetxController{
  late TextEditingController
  nameController,
  contactController,
  addressController,
  emailController,
  passwordController,
  confirmPasswordController;
      
  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    contactController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement $configureLifeCycle
    super.onClose();
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  checkSignup(){
    if(nameController.text.isEmpty){
      customSnackbar("Error", "Name is required", "error");
    } else if (addressController.text.isEmpty)
    {
      customSnackbar("Error", "Address is required", "error");
    }
    else if (contactController.text.isEmpty)
    {
      customSnackbar("Error", "Contact is required", "error");
    }
    else if (emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false)
    {
      customSnackbar("Error", "A Valid email is required", "error");
    }
    else if (passwordController.text.isEmpty)
    {
      customSnackbar("Error", "Password is required", "error");
    }
    else if (confirmPasswordController.text.isEmpty)
    {
      customSnackbar("Error", "Password is required", "error");
    }
    else
    {
      Get.showOverlay(asyncFunction: ()=>signup(), loadingWidget: Loader());
    }
  
  }
  signup() async{
    var response = await http.post(Uri.parse(baseurl+'signup.php'), body: {
    "name":nameController.text,
    "contact":contactController.text,
    "address":addressController.text,
    "email":emailController.text,
    "password":passwordController.text,
    }
    );
    var res = await json.decode(response.body);

    if(res['success']){
      customSnackbar("Success", "Signup Successful", "success");
      Get.offAllNamed(GetRoutes.login);
    }
    else{
      customSnackbar("Error", res['message'], "error");
    }
  }
}