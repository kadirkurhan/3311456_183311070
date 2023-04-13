import 'package:get/get.dart';

class MainController extends GetxController {
  var count = 0.obs;
  var token = "".obs;
  void increment() {
    count.value++;
    update();
  }

  void setToken(String newToken) {
    token.value = newToken;
    update();
  }
}
