import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/screens/auth/login.dart';
import 'package:mobile_programming/screens/auth/register.dart';
import 'package:mobile_programming/screens/home/home.dart';
import 'package:mobile_programming/store/main.dart';

import 'middleware/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

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
                if (AuthMiddleware()) {}
                return controller.token.value.isEmpty
                    ? const LoginScreen()
                    : const HomeScreen();
              }),
          GetPage(
              name: '/register',
              page: () => const RegisterScreen(),
              transition: Transition.fade),
        ],
        home: const HomeScreen());
  }
}
