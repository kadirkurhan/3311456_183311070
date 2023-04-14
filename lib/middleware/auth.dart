import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/store/main.dart';

class AuthMiddleware extends GetMiddleware {
  MainController controller = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (controller.token.isEmpty) {
      print("it is emty");
      return const RouteSettings(name: '/login');
    }
    print("it is not emty");

    return null;
  }
}
