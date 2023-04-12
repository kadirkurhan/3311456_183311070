import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/store/main.dart';
import 'constants/icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    return GetMaterialApp(
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
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(SVG_LEFT_ARROW),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(SVG_DOTS),
            ),
          ],
          title: const Text("Fakültem2",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              ElevatedButton(
                onPressed: () => controller.increment(),
                child: GetX<MainController>(
                  builder: (controller) {
                    return Text(
                      '${controller.count}',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
