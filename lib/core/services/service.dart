import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
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
}
