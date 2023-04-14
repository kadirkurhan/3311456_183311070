import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:mobile_programming/store/main.dart';

class AddAnnouncementScreen extends StatelessWidget {
  const AddAnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    String inputTitle = "";
    String inputMessage = "";
    return Scaffold(
      appBar: AppBarComponent("Add", shouldLeadingShow: false),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  inputTitle = value;
                },
                decoration: InputDecoration(
                  hintText: 'Title',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  inputMessage = value;
                },
                keyboardType: TextInputType.multiline,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  hintText: 'Message',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  print("input");
                  print(inputTitle);
                  print(inputMessage);
                  controller.addAnnouncement(inputTitle, inputMessage);
                  Get.snackbar("Duyuru", "Duyurunuz yayınlanmıştır");
                  Get.offNamed("/announcements");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Yayınla',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
