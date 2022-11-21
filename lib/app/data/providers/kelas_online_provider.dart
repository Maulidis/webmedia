import 'package:get/get.dart';

import '../models/kelas_online_model.dart';

// const baseUrl ="http://192.168.100.8/";
const baseUrl = "http://pkl1.webmediacenter.com/";
const apiGambar = "https://pkl1.webmediacenter.com/api/gambar";
const baseIp = "http://192.168.1.7/";

class KelasOnlineProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return KelasOnline.fromJson(map);
      if (map is List)
        return map.map((item) => KelasOnline.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<KelasOnline?> getKelas(int id) async {
    // final response = await get('http://192.168.100.8/projek-api/api/mahasiswa?paketbimbel_id=88/$id');
    final response = await get('$baseUrl/api/mahasiswa?paketbimbel_id=88/$id');
    return KelasOnline.fromJson(response.body["data"]);
  }

  Future<List<KelasOnline>> getAllKelas() async {
    // final response = await get('http://192.168.1.9/projek-api/api/mahasiswa');
    final response = await get('http://192.168.1.7/projek-api/api/mahasiswa');
    return KelasOnline.fromJsonList(response.body["data"]);
  }
}
