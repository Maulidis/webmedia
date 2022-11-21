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
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
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
                      'PENDAFTARAN',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
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
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: tgl_lahirC,
                    hint: 'tanggal lahir', 
                    icon: Icons.calendar_month,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: jenis_kelamin,
                    hint: 'jenis kelamin', 
                    icon: Icons.group,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: emailC,
                    hint: 'Email', 
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: pwdInput,
                    hint: 'Password',
                    obscureText: true, 
                    icon: Icons.key,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: confirmPwd,
                    hint: 'Confirm Password',
                    obscureText: true, 
                    icon: Icons.key,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: noHpC,
                    hint: 'no hp', 
                    icon: Icons.call,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: alamatC,
                    hint: 'alamat', 
                    icon: Icons.home,
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
                            text: ' Masuk ',
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
         ],
        ),
      ),
    );
  }
}
