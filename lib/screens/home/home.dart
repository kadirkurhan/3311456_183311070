import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

import '../../store/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    return Scaffold(
      appBar: AppBarComponent("Home"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () => controller.increment(),
              child: GetX<MainController>(
                builder: (controller) {
                  return Text(
                    '${controller.count}',
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => Get.toNamed("/register"),
                child: const Text("next page")),
          ],
        ),
      ),
    );
  }
}
