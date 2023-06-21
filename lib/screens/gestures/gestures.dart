import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

import '../../components/drawer/drawer.dart';
import '../../store/main.dart';

class GesturesScreen extends StatefulWidget {
  const GesturesScreen({super.key});

  @override
  State<GesturesScreen> createState() => _GesturesScreenState();
}

class _GesturesScreenState extends State<GesturesScreen> {
  final String imageUrl =
      'https://earthquake-images.s3.eu-central-1.amazonaws.com/DSC_0424.JPG';

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    double _scale = 1.0;
    double _previousScale = 1.0;

    void _updateGestureText(String text) {
      controller.setGestureResultText(text);
    }

    void getScaleRatio() {
      _scale = controller.scale.value;
    }

    return Scaffold(
      appBar: AppBarComponent("Gestures", shouldLeadingShow: false),
      drawer: const DrawerMenuComponent(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Elde Edilen Sonuç:',
                style: TextStyle(fontSize: 18),
              ),
              GetX<MainController>(
                builder: (controller) {
                  return Text(
                    '${controller.gestureResultText}',
                  );
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _updateGestureText('Tıklama yapıldı'),
                onDoubleTap: () => _updateGestureText('Çift tıklama yapıldı'),
                onLongPress: () => _updateGestureText('Uzun basma yapıldı'),
                onVerticalDragUpdate: (_) =>
                    _updateGestureText('Dikey sürükleme yapıldı'),
                onHorizontalDragUpdate: (_) =>
                    _updateGestureText('Yatay sürükleme yapıldı'),
                // onScaleStart: (ScaleStartDetails details) {
                //   controller.setPrevScale(_scale);
                //   getScaleRatio();
                // },
                // onScaleUpdate: (ScaleUpdateDetails details) {
                //   controller.setScale(_previousScale * details.scale);
                //   getScaleRatio();
                // },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 150.0),
                  color: Colors.blue,
                  child: Transform.scale(
                      key: Key(_scale.toString()),
                      scale: _scale,
                      child: Image.network(imageUrl)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
