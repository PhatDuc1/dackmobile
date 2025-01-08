import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dack_mobile/controller/product_controller.dart';
import 'package:dack_mobile/widgets/CategoriesWidget.dart';
import 'package:dack_mobile/widgets/HomAppBar.dart';
import 'package:dack_mobile/widgets/ItemsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ứng Dụng Đặt Vé Xem Phim!",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Tất cả phim'),
                onTap: () => controller.searchCate("", ""),
              ),
              ListTile(
                title: const Text('Mọi lứa tuổi'),
                onTap: () => controller.searchCate("","1"),
              ),
              ListTile(
                title: const Text('Trên 13 tuổi'),
                onTap: () => controller.searchCate("","13"),
              ),
              ListTile(
                title: const Text('Trên 16 tuổi'),
                onTap: () => controller.searchCate("","16"),
              ),
              ListTile(
                title: const Text('Trên 18 tuổi'),
                onTap: () => controller.searchCate("","18"),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            // HomeAppBar(),
            Container(
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // Tìm kiếm
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 50,
                              width: 300,
                              child: TextFormField(
                                onChanged: (val) {
                                  controller.searchCate(val, "");
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Tìm kiếm...",
                                ),
                              ),
                            ),
                          ],
                        )),
                    // Tiêu đề "Xem Phim Ngay!"
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Phim Sắp Ra Mắt!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    // Danh mục
                    CategoriesWidget(),
                    // Tiêu đề "Phim Nổi Bật Tháng 1"
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Phim Nổi Bật Tháng 1",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    // Các mục nổi bật
                    ItemsWidget(),
                  ],
                )),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) {},
          height: 50,
          color: Color(0xFF4C53A5),
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              CupertinoIcons.cart_fill,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
