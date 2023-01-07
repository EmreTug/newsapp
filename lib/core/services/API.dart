import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

/// The service responsible for networking requests
class Api {
  Future<UserModel?> getUser(String email, String password) async {
    var result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (result.user != null) {
      return UserModel(id: result.user!.uid, name: "");
    } else {
      return null;
    }
  }

  Future<UserModel?> createUser(String email, String password) async {
    var result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (result.user != null) {
      return UserModel(id: result.user!.uid, name: "");
    } else {
      return null;
    }
  }



  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var result = await FirebaseAuth.instance.signInWithCredential(credential);
    if (result.user == null) {
      return null;
    }
    else{
    return UserModel(id: result.user!.uid, name: "");

    } 
    } catch (e) {
       
      print(e); 
    }
  }

    Future<void> sendpasswordresetmail(String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email);
    
  }
  
 
}
