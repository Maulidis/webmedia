import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans.dart';
import '../../../routes/app_pages.dart';
class BootomAppBar extends StatelessWidget {
  const BootomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: const Icon(
              Icons.person,
              color: kButton,
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: const Icon(
              Icons.home,
              color: kButton,
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEMUA_KELAS),
            icon: const Icon(
              Icons.book,
              color: kButton,
            ),
          ),
        ],
      ),
    );
  }
}
