// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/constans.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../widget/profile_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.HOME),
          icon: Icon(Icons.arrow_back_ios, color: kWhite,),
        ),
        title: const Text('Profile', style: TextStyle(color: kWhite),),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kButton,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Container(
            color: kButton,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),CircleAvatar(
                  radius: 55,
                  backgroundColor: kWhite,
                  child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png"),
                 ),    
                ),
                
                SizedBox(
                  height: 20,
                ),
                profileName(),
                profileTlpn(),
                profileEmail(),
                profileLahir(),
                profileJk(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
