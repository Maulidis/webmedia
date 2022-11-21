// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:webmedia/constans.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_button.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Image.asset("assets/images/main_top.png"),
            //   width: size.width * 0.3,
            // ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selamat Datang Di Webmedia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kText,
                    ),
                  ),
                  SizedBox(height: size.height *0.05),
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: size.height * 0.45,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.height * 0.8,
                    child: CustomButton(
                    label: 'MASUK',
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                    ),
                  ), 
                  SizedBox(height: size.height * 0.02),
                  Column(
                    children: [
                      CustomButton2(
                        label: 'DAFTAR',
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
