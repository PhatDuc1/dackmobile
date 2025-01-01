import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
  Key? key, 
  required this.hint, 
  this.obscureText = false,
  this.controller, 
  this.keyboardType = TextInputType.text
  }): super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;


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
                            controller: controller,
                            obscureText: obscureText,
                            keyboardType: keyboardType,

                            decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hint,
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