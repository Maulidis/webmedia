import 'package:get/get.dart';
import 'package:webmedia/app/data/models/bimbel_model.dart';
import '../../../data/models/bimbel_model.dart';
import '../../../data/providers/bimbel_provider.dart';
class HomeController extends GetxController {
  BimbelProvider kelasprov = BimbelProvider();

  Future<Bimbel?> getSingleKelas(int id)async{
   return await kelasprov.getKelas(id);
  }
  Future<List<Bimbel>> getAllKelas() async{
    return await kelasprov.getAllKelas();
  }
}
