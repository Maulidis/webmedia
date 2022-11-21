import 'package:flutter/material.dart';
import 'package:webmedia/constans.dart';

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
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: kButton,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 12,
            ),
          ],
        ),
        child:Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ); 
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: kText1,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 12,
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: kWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
