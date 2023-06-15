import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

import '../../components/drawer/drawer.dart';
import '../../store/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String imageUrl =
      'https://earthquake-images.s3.eu-central-1.amazonaws.com/4.JPG';

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
              Image.network(
                imageUrl,
                width: 256,
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
            ],
          ),
        ),
      ),
    );
  }
}
