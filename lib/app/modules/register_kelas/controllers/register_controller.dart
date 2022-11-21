import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webmedia/app/data/providers/api.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  registerkelas(
    String nama,
    String no_hp,
    String email,
    String alamat,
  ) async{

    var map = new Map<String, dynamic>();
    map['nama'] = nama;
    map['no_hp'] = no_hp;
    map['email'] = email;
    map['alamat'] = alamat;

    final response = await http.post(
      Uri.parse(REGISTRATION_KELAS),
      body: map,
    );

    print(response.body);

    Get.offAllNamed(Routes.HOME);
  }
}
