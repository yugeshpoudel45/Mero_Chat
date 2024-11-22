import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      //log user in
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //save user info if it doesn't already exist
      _firestore.collection("Users").doc(result.user!.uid).set(
        {
          "email": email,
          "uid": result.user!.uid,
        },
      );
      return result;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      throw Exception(e.code);
    }
  }

  //register
  Future<UserCredential> registerWithEmailPassword(
      String email, String password) async {
    try {
      //create user
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //save user info in a separate doc
      _firestore.collection("Users").doc(result.user!.uid).set(
        {
          "email": email,
          "uid": result.user!.uid,
        },
      );

      return result;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      throw Exception(e.code);
    }
  }

  //signOut
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
