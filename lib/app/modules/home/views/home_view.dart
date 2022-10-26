// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/data/models/bimbel_model.dart';
import 'package:webmedia/page/DetailScreen.dart';

import '../../../controllers/aunth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //const HomeView({Key? key}) : super(key: key);
  final authC = Get.find<AunthController>();
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebMedia'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Bimbel>>(
          future: controller.getAllKelas(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snap.data?.length == 0) {
              return Center(
                child: Text("Tidaka Ada Data"),
              );
            } else {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    Bimbel kelas = snap.data![index];
                    return new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(todo: snap.data![index]),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            kelas.foto!.isNotEmpty
                                ? Container(
                                    height: 200,
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(kelas.foto!),
                                            fit: BoxFit.cover,
                                      ),
                                        // child: Image.network(kelas.foto!),
                                    ),
                                    child: Container(
                                      height: 30,
                                      color: Colors.white.withOpacity(0.8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${kelas.paketbimbelNama}"),
                                        ],
                                      ),
                                    ),
                                   
                                  )
                                : Container(
                                    height: 200,
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/image.jpeg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Container(
                                      height: 30,
                                      color: Colors.white.withOpacity(0.8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${kelas.paketbimbelNama}"),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
