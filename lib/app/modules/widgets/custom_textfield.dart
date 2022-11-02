import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
    {Key? key, 
    required this.hint, 
    this.obscureText =false, 
    this.controller, 
    this.keyboardType = TextInputType.text, 
    }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 12,
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
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: const Color(0xff949494),
            ),
          ),
        ),
    );
    
  }
}