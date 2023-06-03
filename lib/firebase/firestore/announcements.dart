import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../store/main.dart';

class AnnouncementsFirebaseStore {
  MainController controller = Get.find();

  CollectionReference announcements =
      FirebaseFirestore.instance.collection("announcements");

  Future<void> addAnnouncement(String title, String message) {
    return announcements
        .add({
          'title': title,
          'message': message,
        })
        .then((value) => print("Kullanıcı eklendi"))
        .catchError((error) => print("Hata: $error"));
  }

  Future<void> updateAnnouncement(String id, String title, int message) {
    return announcements
        .doc(id)
        .update({
          'title': title,
          'message': message,
        })
        .then((value) => print("successfuly updated"))
        .catchError((error) => print("Hata: $error"));
  }

  Future<void> deleteAnnouncement(String id) {
    return announcements
        .doc(id)
        .delete()
        .then((value) => print("successfuly deleted"))
        .catchError((error) => print("Hata: $error"));
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    CollectionReference announcements =
        FirebaseFirestore.instance.collection('announcements');

    QuerySnapshot querySnapshot = await announcements.get();

    List<Map<String, dynamic>> allData = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    return allData;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    List<Map<String, dynamic>> userList = [];
    QuerySnapshot querySnapshot = await announcements.get();
    querySnapshot.docs.forEach((document) {
      userList.add(document.data() as Map<String, dynamic>);
    });
    return userList;
  }
}
