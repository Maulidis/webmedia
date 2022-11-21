import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webmedia/CurrencyFormat.dart';
import 'package:webmedia/app/data/models/kelas_online_model.dart';
import 'package:webmedia/app/modules/widgets/custom_button.dart';
import 'package:webmedia/app/routes/app_pages.dart';
import 'package:webmedia/constans.dart';

class DetailOnlineScreen extends StatelessWidget {
  const DetailOnlineScreen({Key? key, required this.onlinedetail}) : super(key: key);
  final KelasOnline onlinedetail;

  @override
  Widget build(BuildContext context) {
    var nominalpendaftaran = int.parse("${onlinedetail.nominalpendaftaran}");
    var paketbimbelNominal = int.parse("${onlinedetail.paketbimbelNominal}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.HOME),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Detail'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: kButton,
      ),
      backgroundColor: kWhite,
      extendBodyBehindAppBar: false,
      body: ListView(
        // padding: EdgeInsets.zero,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        children: [
          onlinedetail.foto!.isNotEmpty
              ? Container(
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(onlinedetail.foto!),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(kelas.foto!),
                  ),
                )
              : Container(
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/image.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(25.0),
          //   child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${onlinedetail.paketbimbelNama}",
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
                    "Deskripsi",
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
                "${onlinedetail.deskripsi}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kSubtitle,
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
              Row(
                children: [
                  Text(
                    "Pendaftaran : ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kText,
                    ),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(nominalpendaftaran, 1),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kSubtitle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Status : ${onlinedetail.status}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kSubtitle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Paket Bimbel : ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kSubtitle,
                    ),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(paketbimbelNominal, 2),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kSubtitle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tanggal : ${onlinedetail.date}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kSubtitle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "Webmedia training center:",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kSubtitle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Jl. Setiabudi, Komp. Setiabudi Bisnis Point No.12-13 CC, Medan – 20122",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kSubtitle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                label: 'Daftar',
                onPressed: () => Get.toNamed(Routes.REGISTER),
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const UserListDemo()),
                //   );
                // },
              ),
            ],
          ),
          // ),
        ],
      ),
    );
  }
}
