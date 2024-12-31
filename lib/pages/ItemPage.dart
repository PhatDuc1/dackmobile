import 'package:dack_mobile/widgets/ItemAppBar.dart';
import 'package:flutter/material.dart';
class ItemPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    backgroundColor: Color(0xFFEDECF2),
    body: ListView(
      children: [
        ItemAppBar(),
      ],

    ),
  );
  }
  
}