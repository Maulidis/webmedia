import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:webmedia/app/routes/app_pages.dart';
import 'package:webmedia/constans.dart';

import '../app/data/models/bimbel_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Bimbel todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: kText,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
           todo.foto!.isNotEmpty
              ? Container(
                  height: 300,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(todo.foto!),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(kelas.foto!),
                  ),
                )
              : Container(
                  height: 300,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/image.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${todo.paketbimbelNama}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Text(
                      "Deskripsi:",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kText,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${todo.deskripsi}",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text(
                      "Informasi Training:",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kText,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Pendaftaran : ${todo.nominalpendaftaran}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Status : ${todo.status}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Paket bimbel : ${todo.paketbimbelNominal}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tanggal : ${todo.date}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(" Daftar "),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
