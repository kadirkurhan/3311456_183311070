import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent("Register"),
      body: Center(
        child: Row(children: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("prev. page"))
        ]),
      ),
    );
  }
}
