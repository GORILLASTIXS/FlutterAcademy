import 'package:flutter/material.dart';
class GoogleSiginInScreen extends StatefulWidget {
  const GoogleSiginInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSiginInScreen> createState() => _GoogleSiginInScreenState();
}

class _GoogleSiginInScreenState extends State<GoogleSiginInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome to Flutter Meet"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/gorilla.png"),
          ),
          CustomElevateButtton(text:, onpressed: (){})
        ],
      ),
    );
  }
}
