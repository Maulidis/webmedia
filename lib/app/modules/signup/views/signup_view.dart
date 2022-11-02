import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webmedia/app/controllers/aunth_controller.dart';
import 'package:webmedia/app/modules/widgets/custom_textfield.dart';
import 'package:webmedia/constans.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_button.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final namaC = TextEditingController();
  final alamatC = TextEditingController();
  final noHpC = TextEditingController();
  final tgl_lahirC = TextEditingController();
  final jenis_kelamin = TextEditingController();
  //const LoginView({Key? key}) : super(key: key);
  final emailC = TextEditingController();
  final pwdInput = TextEditingController();
  final confirmPwd = TextEditingController();
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
                height: 80,
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
                controller: namaC,
                hint: 'nama',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: tgl_lahirC,
                hint: 'tanggal lahir',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: jenis_kelamin,
                hint: 'jenis kelamin',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: emailC,
                hint: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: pwdInput,
                hint: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: confirmPwd,
                hint: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: noHpC,
                hint: 'no hp',
              ), 
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: alamatC,
                hint: 'alamat',
              ),     
              
              SizedBox(
                height: 20,
              ),
              
              CustomButton(
                label: "Daftar",
                onPressed: ()=> authC.signup(
                  namaC.text, 
                  emailC.text, 
                  pwdInput.text,
                  confirmPwd.text, 
                  alamatC.text, 
                  noHpC.text, 
                  tgl_lahirC.text,
                  jenis_kelamin.text
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