import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/modules/widgets/custom_button.dart';

import '../../../../constans.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
   RegisterView({Key? key}) : super(key: key);

  final namaC = TextEditingController();
  final noHpC = TextEditingController();
  final emailC = TextEditingController();
  final alamatC = TextEditingController();
  final kelas = Get.find<RegisterController>();

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
                height: 30,
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
                controller: namaC,
                hint: 'Nama', 
                icon: Icons.person,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: noHpC,
                hint: 'No Telpon',
                icon: Icons.call,
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
                controller: alamatC,
                hint: 'Alamat',
                icon: Icons.home,
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // CustomTextField(
              //   hint: 'Tanggal Lahir',
              //   icon: Icons.calendar_month,
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // CustomTextField(
              //   hint: 'Jenis Kelamin',
              //   icon: Icons.group,
              // ),
              
              SizedBox(
                height: 20,
              ),
              //button login
              CustomButton(
                label: 'Daftar',
                  onPressed: () => kelas.registerkelas(
                    namaC.text, 
                    noHpC.text, 
                    emailC.text, 
                    alamatC.text),
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
