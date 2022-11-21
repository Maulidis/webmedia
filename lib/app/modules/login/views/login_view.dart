
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/controllers/aunth_controller.dart';
import 'package:webmedia/app/modules/widgets/custom_button.dart';
import 'package:webmedia/app/modules/widgets/custom_textfield.dart';
import 'package:webmedia/constans.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  //const LoginView({Key? key}) : super(key: key);
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<AunthController>();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          key: formKey ,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png"),
                width: size.width * 0.4,
              ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'MASUK',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 54,
                          color: kText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      controller: emailC,
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress, 
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passC,
                      hint: 'Password',
                      icon: Icons.key,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //button login
                    CustomButton(
                      label: "Masuk",
                      onPressed: () => authC.login(
                        emailC.text,
                        passC.text,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff949494),
                        ),
                        children: [
                          TextSpan(
                            text: 'Tidak punya akun?',
                          ),
                          TextSpan(
                              text: ' Daftar ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                              style: TextStyle(
                                color: Color(0xff6b7afc),
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
