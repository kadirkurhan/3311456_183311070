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
          ),
          ListTile(
            title: const Text("Duyurular"),
            onTap: () {
              Get.toNamed("/announcements");
            },
          ),
        ],
      ),
    );
  }
}
