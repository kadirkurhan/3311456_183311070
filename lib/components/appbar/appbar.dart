import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/icons.dart';

AppBar AppBarComponent(String title, {bool shouldLeadingShow = true}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: shouldLeadingShow ? const BackButton() : null,
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {
          Get.snackbar("yasemin", "bak postacı geliyor selam veriyor");
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(SVG_DOTS),
        ),
      ),
    ],
    title: Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
  );
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(SVG_LEFT_ARROW),
      ),
    );
  }
}
