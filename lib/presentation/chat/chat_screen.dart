import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final firebase = FirebaseDatabase.instance.ref('chats');

  send(senderId , receiverId , message) async {
    await firebase.child('$senderId$receiverId').child('messages').push().set({
      "id" : Random().nextInt(1000),
      "message":message,
      "senderId":senderId,
    }).then((value) => firebase.child('$receiverId$senderId').child('messages').push().set({
      "id" : Random().nextInt(1000),
      "message":message,
      "senderId":senderId,
    })).catchError((e){
      print("firebase error is ${e.toString()}");
    });
  }

  get(senderId , receiverId , message) async {
    await firebase.child('$senderId$receiverId').child('messages').push().set({
      "id" : Random().nextInt(1000),
      "message":message,
      "senderId":senderId,
    }).then((value) => firebase.child('$receiverId$senderId').child('messages').push().set({
      "id" : Random().nextInt(1000),
      "message":message,
      "senderId":senderId,
    })).catchError((e){
      print("firebase error is ${e.toString()}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
