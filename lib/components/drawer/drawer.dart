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
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/profileImage.jpg'),
            ),
          ),
          // DrawerHeader(
          //   decoration: BoxDecoration(color: Colors.black),
          //   child: Column(
          //     children: [
          //       ClipOval(
          //         child: Image.asset(
          //           'assets/icons/profileImage.jpg',
          //           fit: BoxFit.cover,
          //           width: 110.0,
          //           height: 110.0,
          //         ),
          //       ),
          //       const Expanded(
          //         child: Text(
          //           "Kadir Kurhan",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          ListTile(
            title: const Text("Duyurular"),
            onTap: () {
              Get.toNamed("/announcements");
            },
          ),
          ListTile(
            title: const Text("Option 2"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// Drawer DrawerMenuComponent() {
//   return Drawer(
//     child: Column(
//       children: [
//         DrawerHeader(
//           decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 198, 213, 224),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 child: Image.asset('assets/icons/profileImage.jpg'),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'test',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Diğer Drawer öğeleri
//       ],
//     ),
//   );
// }
