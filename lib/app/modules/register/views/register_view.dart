import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constans.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: kText,
      ),
      body: SingleChildScrollView(
        child: Padding( 
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center, 
                // child: Text(
                //   'Register',
                //   style: TextStyle(
                //     fontFamily: 'Poppins',
                //     fontSize: 54,
                //     color: kText,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),

                //logo
                child: Image.asset("assets/images/webmedialogo.png"),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                hint: 'Nama',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'No Handphone',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'Email',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'Tanggal Lahir',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'Alamat',
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              //button login
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.HOME),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(" Daftar "),
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
                    // TextSpan(
                    //   text: 'Sudah punya akun?',
                    // ),
                    // TextSpan(
                    //     text: ' Login ',
                    //     recognizer: TapGestureRecognizer()
                    //       ..onTap = () {
                    //         Get.toNamed(Routes.LOGIN);
                    //       },
                    //     style: TextStyle(
                    //       color: Color(0xff6b7afc),
                    //       fontWeight: FontWeight.w600,
                    //     ))
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
