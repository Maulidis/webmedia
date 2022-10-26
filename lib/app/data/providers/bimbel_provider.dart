
import 'package:get/get.dart';

import '../models/bimbel_model.dart';

// const baseUrl ="http://192.168.100.8/";
const baseUrl = "http://pkl1.webmediacenter.com/";
const apiGambar = "https://pkl1.webmediacenter.com/api/gambar";

class BimbelProvider extends GetConnect {
  Future<Bimbel?> getKelas(int id) async {
    // final response = await get('http://192.168.100.8/projek-api/api/mahasiswa?paketbimbel_id=88/$id');
    final response = await get('$baseUrl/api/mahasiswa?paketbimbel_id=88/$id');
    return Bimbel.fromJson(response.body["data"]);
  }

  Future<List<Bimbel>> getAllKelas() async {
    // final response = await get('http://192.168.100.8/projek-api/api/mahasiswa');
    final response = await get('$baseUrl/api/mahasiswa');
    return Bimbel.fromJsonList(response.body["data"]);
  }
  
}