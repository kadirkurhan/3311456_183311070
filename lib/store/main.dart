import 'package:get/get.dart';
import 'package:mobile_programming/models/user.dart';

class MainController extends GetxController {
  var count = 0.obs;
  var token = "".obs;
  var user = UserModel(username: '').obs;

  List<Map> announcements = [
    {
      "title": "Tatil",
      "message": "Hava durumu sebebiyle bugünkü ders iptal edilmiştir."
    }
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
}
