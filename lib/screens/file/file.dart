import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobile_programming/store/main.dart';
import 'package:http/http.dart' as http;

import '../../utils/file_utils.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  String fileContents = "";
  String inputData = "";

  @override
  void initState() {
    super.initState();
    FileUtils.readFromFile().then((contents) {
      setState(() {
        fileContents = contents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent("Dosyalar", shouldLeadingShow: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => inputData = value,
                ),
              ),
              ElevatedButton(
                child: const Text("Dosyaya Kaydet"),
                onPressed: () {
                  FileUtils.saveToFile(inputData);
                },
              ),
              ElevatedButton(
                child: const Text("Dosyadan Oku"),
                onPressed: () {
                  FileUtils.readFromFile().then((contents) {
                    setState(() {
                      print(contents);
                      fileContents = contents;
                    });
                  });
                },
              ),
              Text(fileContents)
            ],
          ),
        ),
      ),
    );
  }
}
