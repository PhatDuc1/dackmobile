import 'dart:convert';

import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/utils/baseurl.dart';
import 'package:dack_mobile/utils/custom_snackbar.dart';
import 'package:dack_mobile/widgets/Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController{
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose(){
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  checkLogin(){
    if (emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false)
    {
      customSnackbar("Error", "A Valid email is required", "error");
    }
    else if (passwordController.text.isEmpty)
    {
      customSnackbar("Error", "Password is required", "error");
    }
    else{
      Get.showOverlay(
        asyncFunction: () => login(), loadingWidget: const Loader());
    }
  }
  
  login()async{
    var response = await http.post(Uri.parse('${baseurl}login.php'), body: {
    "email":emailController.text,
    "pass":passwordController.text,
    }
    );

    var res = jsonDecode (response.body);

    if(res['success']){
      customSnackbar("Success", "go", "success");
      Get.offAllNamed(GetRoutes.home);
    }
    else{
      customSnackbar("Error", "no", "error");
    }
  }
}