import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fakültem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/icons/Arrow - Left 2.svg"),
            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
          title: const Text("Fakültem2",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
