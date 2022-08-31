import 'package:flutter/material.dart';
import 'package:meet_app/resources/google_auth.dart';
import 'package:meet_app/widgets/custom_elevated_button.dart';

class GoogleSiginInScreen extends StatefulWidget {
  const GoogleSiginInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSiginInScreen> createState() => _GoogleSiginInScreenState();
}

class _GoogleSiginInScreenState extends State<GoogleSiginInScreen> {
  final GoogleAuth googleAuth = GoogleAuth();
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
           CustomElevatedButton(text: 'Login', onPressed: () async {
             bool res = await googleAuth.signInWithGoogle(context);
             if(res){
               Navigator.pushNamed(context, '/home');
             }
           })
        ],
      ),
    );
  }
}
