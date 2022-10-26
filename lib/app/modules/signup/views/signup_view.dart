import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/controllers/aunth_controller.dart';
import 'package:webmedia/app/modules/widgets/custom_button.dart';
import 'package:webmedia/app/modules/widgets/custom_textfield.dart';
import 'package:webmedia/constans.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  //const LoginView({Key? key}) : super(key: key);
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<AunthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'SignUp',
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
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: passC,
                hint: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),

              //button login
              CustomButton(
                label: "Daftar",
                onPressed: () => authC.signup(emailC.text, passC.text),
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
                      text: 'Sudah punya akun?',
                    ),
                    TextSpan(
                        text: ' LOGIN ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.LOGIN);
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
    );
  }
}
