import 'dart:async';
import 'dart:io';

import 'package:chat_app/models/model.dart';
import 'package:chat_app/models/user_shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common.dart';

class AppFirebaseAuth extends AuthRepo {
  AppFirebaseAuth(this._db);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserSharedPreference userSharedPreference = UserSharedPreference();
  final Database _db;

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

//   void initialize() async {
//     try {
//   _auth.runTransaction((Transaction tx) {}).timeout(Duration(seconds: 5));
//   hasConnection = true;
// } on PlatformException catch(_) { // May be thrown on Airplane mode
//   hasConnection = false;
// } on TimeoutException catch(_) {
//   hasConnection = false;
// }
//   }
  @override
  Future createUser(
    String email,
    String password,
    bool isOnline,
    String lastSeen,
  ) async {
    try {
      final userData = {
        'email': email,
        'isOnline': isOnline,
        'lastSeen': lastSeen,
      };
      final contactData = {
        'email': email,
        'imageUrl': 'nil',
        'isOnline': false,
        'lastMessage': '',
        'lastSeen': DateTime.now().millisecondsSinceEpoch,
      };
      final response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await _db.createUserDoc(response.user!.uid, userData);
      await _db.getProfileImage(response.user!.uid);
      // await _db.addContact(response.user!.uid, contactData);
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser> signIn(String email, String password) async {
    try {
      AppUser? appUser;
      final response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      appUser = await _db.getUserInfo(response.user!.uid);
      // print(appUser.userName);
      await userSharedPreference.setUserEmail(appUser.userName);
      await userSharedPreference.setUserId(response.user!.uid);
      return appUser;

      // final res = _db.importContacts(response.user!.uid, email);
      // print(res);

      // return AppUser(isOnline: false);
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateStatus(bool isOnline) async {
    final prefs = await SharedPreferences.getInstance();
    final uId = prefs.getString('uId');
    // await _db.getProfileImage(uId!);
    // await _db.updateState(uId!, isOnline);

    // try {
    //   // _db.db.collection('users').doc(uId).update(
    //   //     {'isOnline': true, 'lastSeen': FieldValue.serverTimestamp()});
    //   _db.db.runTransaction((transaction) async {
    //     return transaction;
    //   }).timeout(const Duration(seconds: 5));
    //   _db.db.collection('users').doc(uId).update(
    //         {'isOnline': true, 'lastSeen': FieldValue.serverTimestamp()});
    // } on PlatformException {
    //   _db.db.collection('users').doc(uId).update(
    //       {'isOnline': false, 'lastSeen': FieldValue.serverTimestamp()});
    // } on TimeoutException {
    //   _db.db
    //       .collection('users')
    //       .doc(uId)
    //       .set({'isOnline': false, 'lastSeen': Timestamp.now()});
    // } on SocketException {
    //   _db.db
    //       .collection('users')
    //       .doc(uId)
    //       .set({'isOnline': false, 'lastSeen': Timestamp.now()});
    // }
  }
}
