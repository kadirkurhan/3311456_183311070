import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/main.dart';

class DrawerMenuComponent extends StatelessWidget {
  const DrawerMenuComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: GetX<MainController>(
              builder: (controller) {
                return Text(
                  '${controller.user.value.username}',
                );
              },
            ),
            accountEmail: Text('ogr.mail@selcuk.edu.tr'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/profileImage.jpg'),
            ),
            decoration: BoxDecoration(color: Colors.indigo),
          ),
          ListTile(
            title: const Text("Anasayfa"),
            onTap: () {
              Get.toNamed("/home");
            },
          ),
          ListTile(
            title: const Text("Duyurular"),
            onTap: () {
              Get.toNamed("/announcements");
            },
          ),
          ListTile(
            title: const Text("Bildirimler"),
            onTap: () {
              Get.toNamed("/notifications");
            },
          ),
          ListTile(
            title: const Text("Dosya İşlemleri"),
            onTap: () {
              Get.toNamed("/file");
            },
          ),
          ListTile(
            title: const Text("Mesaj"),
            onTap: () {
              Get.toNamed("/message");
            },
          ),
          ListTile(
            title: const Text("Grafik"),
            onTap: () {
              Get.toNamed("/graphics");
            },
          )
        ],
      ),
    );
  }
}
