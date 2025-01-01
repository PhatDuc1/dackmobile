import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "45.000 VND", 
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold
              ),
            ),
          ElevatedButton.icon(
            onPressed: () {}, 
            icon: Icon(CupertinoIcons.cart_badge_plus),
            label: Text("Add To Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),))
        ],
      ),
    );
    
  }
}