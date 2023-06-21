import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobile_programming/store/main.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // final String apiUrl =
  //     'https://3dff-176-54-213-4.ngrok-free.app/api/emergency/create';

  final String apiUrl =
      "http://ec2-3-72-63-87.eu-central-1.compute.amazonaws.com/api/emergency/create";

  final String emailUrl =
      'https://sxr1s0a06j.execute-api.eu-central-1.amazonaws.com/ses/api/email';

  Future<void> emailTrigger() async {
    final response = await http.get(
      Uri.parse(emailUrl),
      headers: {'Content-Type': 'application/json'},
    );
    Get.snackbar("Bildirim", "Email başarıyla gönderildi.");
  }

  Future<void> postData() async {
    final data = {
      "senderUserId": 1,
      "receivers": [
        {
          "userId": 2,
          "receiverName": "yasemin",
          "phoneNumber": "+905457624338",
          "longidute": "30.31",
          "latidute": "23.12",
          "time": "12.12.2023 20:55"
        },
        {
          "userId": 1,
          "receiverName": "kadir",
          "phoneNumber": "+905457624338",
          "longidute": "30.31",
          "latidute": "23.12",
          "time": "12.12.2023 20:55"
        },
        {
          "userId": 3,
          "receiverName": "nadir",
          "phoneNumber": "+905457624338",
          "longidute": "30.31",
          "latidute": "23.12",
          "time": "12.12.2023 20:55"
        }
      ]
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      Get.snackbar("Bildirim", "SMS başarıyla gönderildi.");
    } else {
      print('POST isteği başarısız: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent("Bildirimler", shouldLeadingShow: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  child: Text('Sms'),
                  onPressed: () {
                    postData();
                  },
                ),
                ElevatedButton(
                  child: Text('Email'),
                  onPressed: () {
                    emailTrigger();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
