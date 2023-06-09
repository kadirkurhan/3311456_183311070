import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/models/message.dart';
import 'package:mobile_programming/store/main.dart';

import '../../components/appbar/appbar.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../firebase/firestore/announcements.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Database? db;
  MainController controller = Get.find();

  Future<bool> checkInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future connectDatabase() async {
    String path = join(await getDatabasesPath(), 'messages.db');

    db = await openDatabase(
      path,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE messages(id INTEGER PRIMARY KEY, title TEXT, message TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertMessage(MessageDTO input) async {
    // Get a reference to the database.
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    var res = await db!.insert(
      'messages',
      input.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    controller.setLastMessageTitle(input.message);
  }

  Future<MessageDTO> getMessage() async {
    // Get a reference to the database.
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db!.query('messages');
    var dto = MessageDTO(
        title: maps.last["title"].toString(),
        message: maps.last["message"].toString());

    print("maps is $maps");
    controller.setLastMessageTitle(dto.message);
    return dto;
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    // return List.generate(maps.length, (i) {
    //   return MessageDTO(
    //     title: maps[i]['title'],
    //     message: maps[i]['message'],
    //   );
    // });
  }

  @override
  void initState() {
    super.initState();
    connectDatabase();
  }

  String text = "";
  Future<MessageDTO> updateMessage() async {
    setState(() {
      text = '';
    });

    return await getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkInternetConnection(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              print("last message sended to firebase");
              AnnouncementsFirebaseStore().addAnnouncement(
                  controller.sqfliteMessageTitle.value,
                  controller.sqfliteMessageTitle.value);
            }
            return Scaffold(
              appBar: AppBarComponent("Mesaj", shouldLeadingShow: true),
              body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          snapshot.data == false
                              ? "İnternet bağlantısı yok"
                              : "İnternet bağlantısı var",
                          style: TextStyle(
                            color: snapshot.data == false
                                ? const Color.fromRGBO(255, 0, 0, 0.9)
                                : Color.fromARGB(226, 0, 145, 0),
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            text = value;
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Gönder'),
                          onPressed: () {
                            insertMessage(
                                MessageDTO(title: text, message: text));
                            updateMessage();
                          },
                        ),
                        Text(controller.sqfliteMessageTitle.value),
                        ElevatedButton(
                          child: const Text('Tümünü sil'),
                          onPressed: () async {
                            var deletedItemsCount = await db!.delete(
                              'messages',
                            );

                            print(await db!.query("messages"));

                            Get.snackbar("Silinen kayıtlar",
                                deletedItemsCount.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
