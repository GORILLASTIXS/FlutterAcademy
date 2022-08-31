import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_app/resources/google_auth.dart';
import 'package:meet_app/screens/HomeScreen.dart';
import 'package:meet_app/screens/google_sign_in_screen.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => const GoogleSiginInScreen(),
        '/home': (context) => const HomeScreen(),
      },

      home: StreamBuilder(
        stream: GoogleAuth().authUpdates,
        builder:  (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return HomeScreen();

          } return GoogleSiginInScreen();
        })
    );
  }
}
