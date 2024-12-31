
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"id": 1, "title": "Phim 1", "image": "images/1.png", "price": "200.000 VND", "discount": "-10%"},
    {"id": 2, "title": "Phim 2", "image": "images/2.png", "price": "180.000 VND", "discount": "-5%"},
    {"id": 3, "title": "Phim 3", "image": "images/3.png", "price": "250.000 VND", "discount": "-15%"},
    {"id": 4, "title": "Phim 4", "image": "images/4.png", "price": "300.000 VND", "discount": "-20%"},
    {"id": 5, "title": "Phim 5", "image": "images/5.png", "price": "220.000 VND", "discount": "-10%"},
    // Thêm dữ liệu sản phẩm khác nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phần giảm giá
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (item["discount"] != null)
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item["discount"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              // Hình ảnh sản phẩm
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "itemPage", arguments: item);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    item["image"],
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tiêu đề sản phẩm
              Text(
                item["title"],
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4C53A4),
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Mô tả sản phẩm
              Text(
                "Mô tả phim",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4C53A5),
                ),
              ),
              // Giá và nút giỏ hàng
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item["price"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Color(0xFF4C53A5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
