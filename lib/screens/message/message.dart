import 'package:flutter/material.dart';

import '../../components/appbar/appbar.dart';
//import 'package:connectivity/connectivity.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Future<bool> checkInternetConnection() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   return false;
    // } else {
    //   return true;
    // }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkInternetConnection(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBarComponent("Mesaj", shouldLeadingShow: true),
              body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(snapshot.data.toString()),
                        ElevatedButton(
                          child: Text('Gönder'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
