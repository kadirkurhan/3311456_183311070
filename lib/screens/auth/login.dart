import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:mobile_programming/firebase/auth/auth.dart';
import 'package:mobile_programming/store/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String inputEmail = "";
    String inputPassword = "";

    MainController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/icons/login.avif',
                  alignment: Alignment.topCenter),
              TextFormField(
                onChanged: (value) {
                  inputEmail = value;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
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
                onChanged: (value) => {inputPassword = value},
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
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
                onPressed: () async {
                  try {
                    await Auth().signInWithEmailAndPassword(
                        email: inputEmail, password: inputPassword);
                    controller.setUser(inputEmail);
                    controller.setToken(inputEmail);
                    Get.toNamed("/");
                  } catch (e) {
                    print("login error + ${e}");
                  }
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
                  'Giriş Yap',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/register");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text(
                  'Hesabınız yok mu?',
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
