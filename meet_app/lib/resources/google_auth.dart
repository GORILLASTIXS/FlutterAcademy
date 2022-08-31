import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  Stream<User?> get authUpdates =>  _auth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
   bool res = false;
   try{
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth =  await googleUser?.authentication;

     final credentials = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken
     );
    UserCredential userCredential = await  _auth.signInWithCredential(credentials);
    User? user = userCredential.user;

    if(user != null){
      if(userCredential.additionalUserInfo!.isNewUser){
        _firebase.collection('users').doc(user.uid).set({'username': user.displayName,
          'uid': user.uid, 'profilePhoto': user.photoURL}
        );
      }
    }

   } on FirebaseAuthException catch(e){

   }
  }
}