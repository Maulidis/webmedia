// ignore_for_file: unused_local_variabl

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/data/models/bimbel_model.dart';
import 'package:webmedia/app/data/providers/bimbel_provider.dart';
import 'package:webmedia/app/modules/detail_kelas/DetailScreen.dart';
import 'package:webmedia/constans.dart';
import '../../../controllers/aunth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../home/widget/bootom_appbar.dart';
import '../controllers/semua_kelas_controller.dart';

// class HomeView extends GetView<HomeController> {
//   //  HomeView({Key? key}) : super(key: key);

//   final authC = Get.find<AunthController>();
//   TextEditingController searchController = new TextEditingController();
//   late String filter;
// }

class SemuaKelasView extends StatefulWidget {
  const SemuaKelasView({Key? key}) : super(key: key);

  @override
  State<SemuaKelasView> createState() => _SemuaKelasViewState();
}

class _SemuaKelasViewState extends State<SemuaKelasView> {
  final String url ="$baseUrl/api/mahasiswa";
  final authC = Get.find<AunthController>();
  get controller => SemuaKelasController();
  
    @override
    Widget build(BuildContext context) {
      final controler = Get.put(SemuaKelasController());
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: const Text('SEMUA KELAS'),
          centerTitle: true,
          elevation: 0,
          foregroundColor: kText,
          // actions: [
          //   IconButton(
          //     onPressed: () => authC.logout(),
          //     icon: Icon(Icons.logout),
          //   ),
          // ],
        ),
        backgroundColor: kWhite,
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
                return  Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          // Container(
          //   padding: EdgeInsets.all(15),
          //   child: TextField(
          //     textInputAction: TextInputAction.search,
          //     decoration: InputDecoration(
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25.0),
          //         borderSide: BorderSide(
          //           color: Colors.grey,
          //         ),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(20.0),
          //         borderSide: BorderSide(
          //           color: Colors.blue,
          //         ),
          //       ),
          //       suffixIcon: InkWell(
          //         child: Icon(Icons.search),
          //       ),
          //       contentPadding: EdgeInsets.all(15.0),
          //       hintText: 'Search ',
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
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
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(kelas.foto!),
                                    fit: BoxFit.cover,
                                  ),
                                  // child: Image.network(kelas.foto!),
                                ),
                                child: Container(
                                  height: 30,
                                  color:
                                      Colors.white.withOpacity(0.8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${kelas.paketbimbelNama}"),
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
                                  color:
                                      Colors.white.withOpacity(0.8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${kelas.paketbimbelNama}"),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]
        );
              }
            }),
            bottomNavigationBar: BootomAppBar(),
    );
  }
}

