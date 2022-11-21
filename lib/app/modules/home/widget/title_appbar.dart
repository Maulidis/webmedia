import 'package:flutter/material.dart';
import 'package:webmedia/constans.dart';

class TitleAppbar extends StatelessWidget {
  const TitleAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhite,
      elevation: 0,
      leading: Icon(
        Icons.account_circle_rounded,
      color: kButton,
      ),
      leadingWidth: 50,
      title: Text("Hi Maulidis", style: TextStyle(color: kButton),),
      actions: [
        Icon(Icons.more_vert, color: kButton,),
      ], // default is 56
    );
  }
}
