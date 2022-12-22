import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const platform = MethodChannel('flutter_native_bridging');
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Flutter App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              color: Colors.grey,
              child: const Text("call native"),
              onPressed: () {
                callNative();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Show the text of the toast message in home page
          //Text(message)
        ],
      ),
    );
  }

  callNative() async {
    try {
      var result = await platform.invokeMethod('getToastMsg');
      message = result;
    } on PlatformException catch (e) {
      message = "Failed to get battery level: '${e.message}'.";
    }
  }
}
