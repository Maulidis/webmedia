import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webmedia/app/controllers/aunth_controller.dart';
import 'app/modules/semua_kelas/controllers/semua_kelas_controller.dart';
import 'app/routes/app_pages.dart';

import 'app/utils/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put<HomeController>(HomeController());
  Get.put<SemuaKelasController>(SemuaKelasController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AunthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.StreamAuthStatus(),
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true 
            ? Routes.HOME  
            : Routes.WELCOME_SCREEN,
            // home: snapshot.data != null ? HomeView() : LoginView(),
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      },
    );
  }
}
