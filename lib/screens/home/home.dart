import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

import '../../components/drawer/drawer.dart';
import '../../store/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    return Scaffold(
      appBar: AppBarComponent("Home", shouldLeadingShow: false),
      drawer: DrawerMenuComponent(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}
