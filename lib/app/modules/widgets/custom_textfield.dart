
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:webmedia/constans.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
    {Key? key, 
    required this.hint, 
    this.obscureText =false, 
    this.controller, 
    this.keyboardType = TextInputType.text, 
    required this.icon, 
    }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData icon;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          // color: const Color(0xffffffff),
          color: kWhite,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
          validator: (email)=> email !=null && !EmailValidator.validate(email)? 'e':null,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kButton,
            ),
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