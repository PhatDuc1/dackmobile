import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch ({Key? key, required this.onChanged}): super(key:key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            onChanged: (String val){
                              onChanged(val);
                            },
                            decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"Tìm kiếm...",
                            hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xff949494),
                          ),
                          ),
                          ),

                          
                        ),
    );
  }
}