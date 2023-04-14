import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobile_programming/store/main.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  List<dynamic> _messages = [];
  MainController controller = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      _messages = controller.announcements;
    });
  }

  Future<void> _loadMessages() async {
    // final String response =
    //     await rootBundle.loadString('assets/data/init.json');
    // final data = await json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.offAndToNamed("/add-announcement");
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBarComponent("Duyurular", shouldLeadingShow: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Obx(
            () => ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.snackbar(
                        _messages[index]['title'], _messages[index]['message']);
                  },
                  onDoubleTap: () {
                    Get.snackbar("Duyuru", "Duyuru başarıyla kaldırıldı");
                    controller.removeAnnouncement(index);
                  },
                  child: ListTile(
                    title: Text(_messages[index]['title']),
                    subtitle: Text(_messages[index]['message']),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
