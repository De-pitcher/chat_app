import 'dart:async';
import 'dart:io';
import 'package:chat_app/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uuid/uuid.dart';

class Database {
  final db = FirebaseFirestore.instance;
  final database = FirebaseDatabase.instance;
  final storage = FirebaseStorage.instance;

  Future<void> createUserDoc(String uId, Map<String, dynamic> data) async {
    try {
      DatabaseReference ref = database.ref();
      await ref.child('users/$uId').set(data);
    } on FirebaseException {
      rethrow;
    }
  }

  Future addContact(String uId, Map<String, dynamic> data) async {
    try {
      DatabaseReference ref = database.ref();
      await ref.child('contacts/$uId').set(data);
    } on FirebaseException {
      rethrow;
    }
  }

  Future<List<Contact>> importContacts(String uId, String myEmail) async {
    try {
      List<Contact> contacts = [];
      final ref = database.ref().ref.child('contacts');
      ref.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          // final imageUrl = await getProfileImage(key);
          // print(imageUrl);
          if (value['email'] != myEmail) {
            final contact = Contact(
                email: value['email'],
                imageUrl: value['imageUrl'],
                lastMessage: '',
                isOnline: value['isOnline'],
                userName: value['userName'],
                lastSeen:
                    DateTime.fromMillisecondsSinceEpoch(value['lastSeen']));
            contacts.add(contact);
          }
        });
      });
      return contacts;
    } on FirebaseException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future _uploadImage(String inputSource, String uId) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      File imageFile = File(pickedImage!.path);

      try {
        await storage.ref().child('profileImage/$uId/image.png').putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) print(err);
    }
  }

  Future<String?> getProfileImage(String uId) async {
    String? result;
    try {
      // await _uploadImage('gallery', uId).whenComplete(() async => result =
      //     await storage
      //         .ref()
      //         .child('profileImage/$uId/image.png')
      //         .getDownloadURL());
      result = await storage
          .ref()
          .child('profileImage/$uId/image.png')
          .getDownloadURL();
    } on FirebaseException {
      rethrow;
    }
    return result;
  }

  Future<AppUser> getUserInfo(String uId) async {
    AppUser? user;
    try {
      // await sendMessage(uId,
      //     message: 'Fourth message', recieverEmail: 'email2@gmail.com');
      // getLastMessage(uId);
      // getMessagesFromContact(uId, 'email2@gmail.com');
      final ref = database.ref();
      final snapshot = await ref.child('users/$uId').get();
      if (snapshot.exists) {
        final result = snapshot.value as Map<dynamic, dynamic>;
        user = AppUser(
            email: result['email'],
            userName: result['userName'],
            isOnline: result['isOnline'],
            lastSeen: result['lastSeen']);
        return user;
      } else {
        throw FirebaseException(plugin: 'Could not retrieve user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future sendMessage(String uId,
      {required String message, required String recieverUserName}) async {
    final data = {
      'email': recieverUserName,
      'message': message,
      'isRead': false,
      'timeStamp': DateTime.now().millisecondsSinceEpoch,
    };
    return database.ref().child('messages/$uId').push().set(data);
  }

  // Future getLastMessage(String uId) async {
  //   final ref = database.ref('messages/$uId');
  //   // ref.onValue.listen((event) {
  //   //   final data = event.snapshot.value as Map<dynamic, dynamic>;
  //   //   // print(data);
  //   //   data.forEach((key, value) async {
  //   //     // if (key == value) {
  //   //     final sortedData = database.ref('messages/$uId/$key').orderByValue().ref;
  //   //     sortedData.get().then((value) {
  //   //       final newValue = value.value as Map<dynamic, dynamic>;
  //   //       if (newValue['email'] == 'email2@gmail.com') {
  //   //         // final List<St
  //   //         // final Set set = Set.from(newValue['messages']);
  //   //         print(newValue['message']);
  //   //       }
  //   //     });
  //   //     // }
  //   //   });
  //   // });

  //   List<Message> messages = [];
  //   final snapshot = await ref.get();
  //   if (snapshot.exists) {
  //     final data = snapshot.value as Map<dynamic, dynamic>;
  //     data.forEach((key, value) async {
  //       final sortedData = database.ref('messages/$uId/$key').ref;
  //       sortedData.get().then((value) {
  //         final newValue = value.value as Map<dynamic, dynamic>;
  //         if (newValue['email'] == 'email2@gmail.com') {
  //           messages.add(Message(
  //               email: newValue['email'],
  //               message: newValue['message'],
  //               isRead: newValue['isRead'],
  //               timestamp: DateTime.parse(newValue['timeStamp'])));
  //           final DateTime lastSeen = DateTime.parse(newValue['timeStamp']);
  //           print(lastSeen);
  //           print(Jiffy(lastSeen).fromNow());
  //           print(newValue['message']);
  //         }
  //         messages.sort((a, b) {
  //           final res =
  //               a.timestamp.toString().compareTo(b.timestamp.toString());
  //           return res;
  //         });
  //         print(messages.reversed.toList());
  //       });
  //     });
  //   }
  // }

  Stream<void> updateUserState(String uId, Contact user) async* {
    final DatabaseReference databaseReference = database.ref();
    final isOnlineTrue = Contact(
        email: user.email,
        userName: user.userName,
        imageUrl: user.imageUrl,
        lastMessage: user.lastMessage,
        isOnline: true,
        lastSeen: DateTime.now());
    await database.ref().child('contacts/$uId').update(isOnlineTrue.toMap());
    final isOnlinefalse = Contact(
        email: user.email,
        userName: user.userName,
        imageUrl: user.imageUrl,
        lastMessage: user.lastMessage,
        isOnline: false,
        lastSeen: user.lastSeen);
    await databaseReference
        .child('contacts/$uId')
        .onDisconnect()
        .update(isOnlinefalse.toMap());
  }
}
