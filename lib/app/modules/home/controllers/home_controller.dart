import 'package:get/get.dart';
import 'package:webmedia/app/data/models/kelas_online_model.dart';

import '../../../data/providers/kelas_online_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement SemuaKelasController
  KelasOnlineProvider onlinekelasprov = KelasOnlineProvider();

  Future<KelasOnline?> getSingleKelas(int id) async {
    return await onlinekelasprov.getKelas(id);
  }

  Future<List<KelasOnline>> getAllKelas() async {
    return await onlinekelasprov.getAllKelas();
  }
}
