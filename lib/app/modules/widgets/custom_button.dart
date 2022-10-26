import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    {Key? key, 
    required this.label, 
    required this.onPressed,
    }) : super(key: key);

  final String label;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 12,
            ),
          ],
        ),
        child:Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ); 
  }
}