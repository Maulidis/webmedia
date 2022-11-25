import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/aunth_controller.dart';
import '../../../routes/app_pages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final authC = Get.find<AunthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(), 
          _drawerItem(
            icon: Icons.folder,
            text: 'Semua Kelas',
            onTap: () => Get.toNamed(Routes.SEMUA_KELAS),
          ),
          _drawerItem(
            icon: Icons.logout,
            text: 'Keluar',
            onTap: () => authC.logout(),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: CircleAvatar(
      child: ClipOval(
        child: Image.network(
          'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
          fit: BoxFit.cover,
          width: 90,
          height: 90,
        ),
      ),
    ),
    accountName: Text('Maulidis Rezeki'),
    accountEmail: Text('maulidis@gmail.com'),
    decoration: BoxDecoration(
      color: Colors.blue,
      image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
    ),
  );
}

Widget _drawerItem({required IconData icon, required String text, required void Function() onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
