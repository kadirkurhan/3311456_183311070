import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mobile_programming/models/user.dart';

class MainController extends GetxController {
  var count = 0.obs;
  var token = "".obs;
  var user = UserModel(username: '').obs;
  var sqfliteMessageTitle = "".obs;
  var gestureResultText = "".obs;
  var scale = 0.0.obs;
  var prevScale = 0.0.obs;

  List<Map> announcements = [
    {
      "title": "Tatil",
      "message": "Hava durumu sebebiyle bugünkü ders iptal edilmiştir."
    }
  ].obs;

  List<Map<String, dynamic>> messages = [
    {"title": "test", "message": "test"}
  ].obs;

  void increment() {
    count.value++;
    update();
  }

  void setToken(String newToken) {
    token.value = newToken;
    update();
  }

  void removeToken() {
    print("removedToken");
    token.value = "";
    update();
  }

  void setUser(String name) {
    user.value = UserModel(username: name);
    update();
  }

  void addAnnouncement(String title, String message) {
    var newAnnouncement = {
      'title': '${title}',
      'message': '${message}',
    };

    announcements.add(newAnnouncement);
    print(announcements);
    update();
  }

  void removeAnnouncement(int index) {
    announcements.removeAt(index);
    update();
  }

  void setLastMessageTitle(String input) {
    sqfliteMessageTitle.value = input;
    update();
    print(
        "setLastMessageTitle launched and input is: $input and sqfliteMessageTitle is $sqfliteMessageTitle");
  }

  void setAllMessages(List<String> list) {
    list.forEach((element) {
      Map<String, dynamic> message = {
        "title": element,
        "message": element
        // Diğer anahtarlar ve değerler eklenebilir...
      };
      messages.add(message);
    });
  }

  void setGestureResultText(String text) {
    gestureResultText.value = text;
    update();
  }

  void setScale(double ratio) {
    scale.value = ratio;
    update();
  }

  void setPrevScale(double ratio) {
    prevScale.value = ratio;
    update();
  }
}
