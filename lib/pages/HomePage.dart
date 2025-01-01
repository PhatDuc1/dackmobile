import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dack_mobile/widgets/CategoriesWidget.dart';
import 'package:dack_mobile/widgets/HomAppBar.dart';
import 'package:dack_mobile/widgets/ItemsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
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
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Tìm kiếm...",
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                ),
                // Tiêu đề "Xem Phim Ngay!"
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Xem Phim Ngay!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                // Danh mục
                CategoriesWidget(),
                // Tiêu đề "Phim Nổi Bật Tháng 12"
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Phim Nổi Bật Tháng 12",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                // Các mục nổi bật
                ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 50,
        color: Color(0xFF4C53A5),
        items: [
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(CupertinoIcons.cart_fill, size: 30, color: Colors.white,),
          Icon(Icons.list, size: 30, color: Colors.white,
          ),
        ],
      ),
    );
  }
}