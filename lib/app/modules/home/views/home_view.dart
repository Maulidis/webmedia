import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webmedia/app/data/models/kelas_online_model.dart';

import 'package:webmedia/constans.dart';
import '../../../controllers/aunth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../detail_online_kelas.dart/DetailOnlineKelas.dart';
import '../controllers/home_controller.dart';
import '../widget/bootom_appbar.dart';
import '../widget/title_appbar.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key,}) : super(key: key);

  final authC = Get.find<AunthController>();
  get controller => HomeController();
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kWhite,
        title: TitleAppbar(),
      ),
      backgroundColor: kWhite,
      body: FutureBuilder<List<KelasOnline>>(
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
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.SEMUA_KELAS),
                              child: Container(
                                height: 180,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x1a000000),
                                        blurRadius: 30,
                                        spreadRadius: 0,
                                        offset: Offset(0, 10)),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/semua_kelas.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: kButton.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: TextButton(
                                              onPressed: () => Get.toNamed(
                                                  Routes.SEMUA_KELAS),
                                              child: Text(
                                                "BELAJAR",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: kWhite),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Rekomendasi Kelas",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "kelas yang terbuka bulan ini",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                              ],
                              ),
                            ),
                            

                            const SizedBox(
                              height: 20,
                            ),
                            //listview
                            Expanded(
                              child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 30,
                                  );
                                },
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: snap.data!.length,
                                itemBuilder: (context, index) {
                                  KelasOnline onlinekelas = snap.data![index];
                                  return new GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailOnlineScreen(
                                              onlinedetail: snap.data![index]),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        onlinekelas.foto!.isNotEmpty
                                        ?
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(0),
                                            image: DecorationImage(
                                              image: NetworkImage(onlinekelas.foto!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                        :
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/php.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            height: 100,
                                            alignment: Alignment.topLeft,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              shadows: <BoxShadow>[
                                                BoxShadow(
                                                    color: Color(0x1a000000),
                                                    blurRadius: 20,
                                                    spreadRadius: 0,
                                                    offset: Offset(0, 10)),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20,
                                                  left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${onlinekelas.paketbimbelNama}",
                                                    // "KELAS DIGITAL MARKETING",
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16,
                                                    ),
                                                  ),SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Pendaftaran : Rp 50.000.00",
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      color: kSubtitle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BootomAppBar(),
    );
  }
}