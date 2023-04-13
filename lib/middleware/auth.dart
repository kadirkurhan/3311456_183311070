import 'package:get/get.dart';
import 'package:mobile_programming/store/main.dart';

bool AuthMiddleware() {
  MainController controller = Get.find();
  print(controller.token.value);

  return true;
}
