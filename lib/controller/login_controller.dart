import 'dart:convert';

import 'package:dack_mobile/routes.dart';
import 'package:dack_mobile/utils/custom_snackbar.dart';
import 'package:dack_mobile/widgets/Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dack_mobile/utils/baseurl.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  checkLogin() {
    // if (nameController.text.isEmpty) {
    //   customSnackbar("Error", "Name is required", "error");
    // } else if (addressController.text.isEmpty) {
    //   customSnackbar("Error", "Address is required", "error");
    Get.showOverlay(
        asyncFunction: () => login(), loadingWidget: const Loader());
  }

  login() async {
    var response = await http.post(Uri.parse('${baseurl}login.php'), body: {
      "email": emailController.text,
      "pass": passwordController.text,
    });
    var res = jsonDecode(response.body);

    if (res['success']) {
      customSnackbar("Success", res['message'], "success");
      // Get.offAllNamed(GetRoutes.home);
    } else {
      customSnackbar("Error", res['message'], "error");
    }
  }
}
