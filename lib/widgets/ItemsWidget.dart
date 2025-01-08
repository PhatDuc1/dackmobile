import 'package:dack_mobile/controller/product_controller.dart';
import 'package:dack_mobile/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      if (controller.results.isEmpty) {
        return Center(child: Text('No items found'));
      }
      return GridView.count(
        childAspectRatio: 0.68,
        // it disable the scroll funcitonlity of gridview
        // then it will scroll in list view of home page
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        // body: Padding(
        // padding: const EdgeInsets.all(10.0),
        // child: Column(
        children: controller.results
            .map((result) => ListProduct(result: result)
                // [
                // for (int i = 1; i < 5; i++)
                // ],
                )
            .toList(),
        // ),
        // ),
      );
    });
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         color: Color(0xFF4C53A5),
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       // child: Text(
          //       //   "-10%",
          //       //   style: TextStyle(
          //       //     fontSize: 14,
          //       //     color: Colors.white,
          //       //     fontWeight: FontWeight.bold,
          //       //   ),
          //       // )
          //     ),
          //   ],
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage", arguments: result);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(result.hinhanh!
                  // height: 100,
                  // width: 120,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              result.ten!,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4C53A4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Text(
                  "Thời lượng: ${result.thoiluong!} phút",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4C53A5),
                  ),
                ),
                Text(
                  "Ngôn ngữ: ${result.ngonngu!}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4C53A5),
                  ),
                ),
                Text(
                  "Đạo diễn: ${result.daodien!}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // Text(
                //   "200.000 VND",
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF4C53A5),
                //   ),
                // ),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Color(0xFF4C53A5),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
