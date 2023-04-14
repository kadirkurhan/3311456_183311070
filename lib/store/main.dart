import 'package:get/get.dart';
import 'package:mobile_programming/models/user.dart';

class MainController extends GetxController {
  var count = 0.obs;
  var token = "".obs;
  var user = UserModel(username: '').obs;
  void increment() {
    count.value++;
    update();
  }

  void setToken(String newToken) {
    token.value = newToken;
    update();
  }

  void setUser(String name) {
    //user.value = UserModel(username: name);
    user.value = UserModel(username: name);
    update();
  }
}
