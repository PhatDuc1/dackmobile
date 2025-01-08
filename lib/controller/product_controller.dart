import 'dart:convert';

import 'package:dack_mobile/model/product.dart';
import 'package:dack_mobile/utils/baseurl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<Result> results = [];
  List<Result> searchText = [];
  List<Result> category = [];

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
      searchText = Product.fromJson(res).result!;
      update();
      // print(results);
    }
  }

  search(String val) {
    if (val.isEmpty) {
      searchText = results;
      update();
      return;
    }

    searchText = results.where((result) {
      return result.ten!.toLowerCase().contains(val.toLowerCase());
    }).toList();

    update();
  }

  cate(String id) {
    if (id == "") {
      category = results;
      update();
      return;
    }
    category = results.where((result) {
      return result.theloaiid! == id;
    }).toList();

    update();
  }
}
