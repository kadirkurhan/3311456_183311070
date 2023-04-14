import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/routes/routes.dart';
import 'package:mobile_programming/screens/announcements/add.dart';
import 'package:mobile_programming/screens/announcements/announcements.dart';
import 'package:mobile_programming/screens/auth/login.dart';
import 'package:mobile_programming/screens/auth/register.dart';
import 'package:mobile_programming/screens/home/home.dart';
import 'package:mobile_programming/store/main.dart';

import 'middleware/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MainController controller = Get.put(MainController());
  // @override
  // void initState() {
  //   super.initState();
  //   if (controller.token.value.isEmpty) {
  //     WidgetsBinding.instance
  //         .addPostFrameCallback((_) => Get.toNamed(Routes.Login));
  //   }
  // }
//test
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Fakültem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            transition: Transition.fade,
            page: () {
              if (controller.token.value == "") {
                print("if worked");
                return const LoginScreen();
              }
              print("if not worked");

              return const HomeScreen();
            },
          ),
          GetPage(
            name: '/register',
            page: () => const RegisterScreen(),
            transition: Transition.fade,
          ),
          GetPage(
              name: '/login',
              page: () => const LoginScreen(),
              transition: Transition.fade),
          GetPage(
              name: '/announcements',
              page: () => const AnnouncementScreen(),
              transition: Transition.fade),
          GetPage(
              name: '/add-announcement',
              page: () => const AddAnnouncementScreen(),
              transition: Transition.fade),
        ],
        home: const HomeScreen());
  }
}
