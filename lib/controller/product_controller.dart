import 'dart:convert';

import 'package:dack_mobile/model/product.dart';
import 'package:dack_mobile/utils/baseurl.dart';
import 'package:dack_mobile/utils/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<Result> results = [];

  @override
  void onInit() {
    super.onInit();
    listProduct();
  }

  listProduct() async {
    var response = await http.post(Uri.parse('${baseurl}product.php'));

    var res = jsonDecode(response.body);

    if (res['success']) {
      results = Product.fromJson(res).result!;
      update();

      // print(results);
    } else {
      customSnackbar("Error", "Password is required", "error");
    }
  }
}
