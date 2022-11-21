import 'package:get/get.dart';

import '../controllers/semua_kelas_controller.dart';

class SemuaKelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaKelasController>(
      () => SemuaKelasController(),
    );
  }
}
